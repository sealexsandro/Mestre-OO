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

      final user = Usuario(nome: nome, login: email, email: email, senha: senha
          //   urlFoto: fuser.photoUrl,
          );
      // user.save();
      this.usuarioDao.save(user);

      return Response.ok(result: true, msg: "Usuario Criado com Sucesso");
    } catch (error) {
      if (error is PlatformException) {
        //  print("Erro codigo firebase $error");
        return Response.error(msg: "Problema de Conexão");
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
      // print("Firebase Nome: ${fuser.displayName}");
      // print("Firebase Email: ${fuser.email}");
      // print("Firebase Foto: ${fuser.photoUrl}");

      // Cria um usuario do app
      final user = Usuario(
          nome: fuser.displayName,
          login: fuser.email,
          email: fuser.email,
          senha: senha
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
      // print("Firebase Nome: " + fuser.displayName);
      // print("Firebase Email: " + fuser.email);
      // print("Firebase Foto: " + fuser.photoUrl);

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
      return Response.error(msg: authError);
    }
  }

  Future<Response> changeEmail(
      String emailAntigo,
      String emailNovo,
      String nomeAntigo,
      String nomeNovo,
      String senhaAntiga,
      String senhaNova) async {
    FirebaseUser user = await _auth.currentUser();

    // print("Email: ${emailAntigo.toString()}");
    // print("Senha: ${senhaAntiga.toString()}");
    // print("nome: ${nomeAntigo.toString()}");

    try {
      _auth
          .signInWithEmailAndPassword(email: emailAntigo, password: senhaAntiga)
          .then((value) {
        user.updateEmail(emailNovo).then((_) {
          print("Succesfull changed email");

          final userUpdateInfo = UserUpdateInfo();
          userUpdateInfo.displayName = nomeNovo;

          user.updateProfile(userUpdateInfo);

          // Cria um usuario do app
          UsuarioDao.clear();
          final user2 = Usuario(
            nome: nomeNovo,
            login: emailNovo,
            email: emailNovo,
            urlFoto: user.photoUrl,
            senha: senhaNova,
          );

          // Dá para usar fachada unificada aqui
          this.usuarioDao.save(user2);
          user.reload();
        });
      }).catchError((error) {
        print("email can't be changed" + error.toString());

        return Response.error(msg: "Erro na Atualização");
      });
      return Response.ok();
    } catch (e) {
      return Response.error(msg: "Não foi possivel Atualizar");
    }
  }

  Future<void> changePassword(
      String email, String senhaAntiga, String senhaNova) async {
    FirebaseUser user = await _auth.currentUser();

    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: senhaAntiga)
          .then((value) {
        user.updatePassword(senhaNova).then((_) {
          print("Succesfull changed senha");

          // Cria um usuario do app
          UsuarioDao.clear();
          final user2 = Usuario(
            nome: user.displayName,
            login: email,
            email: email,
            urlFoto: user.photoUrl,
            senha: senhaNova,
          );

          // Dá para usar fachada unificada aqui
          this.usuarioDao.save(user2);
          user.reload();
        });
      }).catchError((error) {
        print("email can't be changed" + error.toString());

        return Response.error(msg: "Erro na Atualização");
      });

      return Response.ok();
    } catch (e) {
      return Response.error(msg: "Não foi possível atualizar");
    }
  }

  @override
  Future<void> deleteUser() async {
    FirebaseUser user = await _auth.currentUser();
    user.delete().then((_) {
      print("Succesfull user deleted");
    }).catchError((error) {
      print("user can't be delete" + error.toString());
    });
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
