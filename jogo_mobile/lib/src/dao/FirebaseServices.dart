import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jogo_mobile/src/dao/UsuarioDao.dart';
import 'package:jogo_mobile/src/model/usuario.dart';
import 'package:jogo_mobile/utils/Response.dart';

class FirebaseService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String authError = "";
  UsuarioDao usuarioDao;
  FirebaseService() {
    this.usuarioDao = new UsuarioDao();
  }

  Future<Response> cadastrarUser(
      String nome, String email, String senha) async {
    try {
      final FirebaseUser firebaseUser =
          (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      ))
              .user;

      final userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nome;
      firebaseUser.updateProfile(userUpdateInfo);

      return Response.ok(result: true, msg: "Usuario Criado com Sucesso");
    } catch (error) {
      if (error is PlatformException) {
        //  print("Erro codigo firebase $error");
        return Response.error(msg: "Erro ao Salvar Usuário");
      }
      return Response.error(msg: "Não foi Possível salvar o usário");
    }
  }

  Future<Response> login(String email, String senha) async {
    try {
      // Login no Firebase
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      final FirebaseUser fuser = result.user;
      print("Firebase Nome: ${fuser.displayName}");
      print("Firebase Email: ${fuser.email}");
      print("Firebase Foto: ${fuser.photoUrl}");

      // Cria um usuario do app
      final user = Usuario(
        nome: fuser.displayName,
        login: fuser.email,
        email: fuser.email,
        //   urlFoto: fuser.photoUrl,
      );
      // user.save();
      this.usuarioDao.save(user);

      // Resposta genérica
      return Response.ok();
    } catch (error) {
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          authError = 'Verifique seu Login';
          break;
        case 'ERROR_USER_NOT_FOUND':
          authError = 'Verifique seu Login ou Senha';
          break;
        case 'ERROR_WRONG_PASSWORD':
          authError = 'Verifique seu Login ou Senha';
          break;
        default:
          authError = 'Erro de Conexão com a rede!';
          break;
      }
      print("Erro sendo exibido 2 : ${authError.toString()}");

      return Response.error(msg: authError);
    }
  }

/////// LOGIN COM CONTA GOOGlE
  Future loginGoogle() async {
    try {
      // Login com o Google
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // print("Google User: ${googleUser.email}");

      // Credenciais para o Firebase
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login no Firebase
      AuthResult result = await _auth.signInWithCredential(credential);
      final FirebaseUser fuser = result.user;
      print("Firebase Nome: " + fuser.displayName);
      print("Firebase Email: " + fuser.email);
      print("Firebase Foto: " + fuser.photoUrl);

      // Cria um usuario do app
      final user = Usuario(
        nome: fuser.displayName,
        login: fuser.email,
        email: fuser.email,
        urlFoto: fuser.photoUrl,
      );

      // Dá para usar fachada unificada aqui
      this.usuarioDao.save(user);

      // Resposta genérica
      return Response.ok();
    } catch (error) {
      //return Response.error(msg: "Não foi possível fazer o login");
      print("Erro sendo exibido: ${error.code.toString()}");
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          authError = 'Verifique seu Login';
          break;
        case 'ERROR_USER_NOT_FOUND':
          authError = 'Verifique seu Login ou Senha';
          break;
        case 'ERROR_WRONG_PASSWORD':
          authError = 'Verifique seu Login ou Senha';
          break;
        default:
          authError = 'Erro de Conexão com a rede!';
          break;
      }
      print("Erro sendo exibido 2 : ${authError.toString()}");

      return Response.error(msg: authError);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
