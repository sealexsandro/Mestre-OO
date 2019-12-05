import 'package:jogo_mobile/src/dao/prefs.dart';
import 'package:jogo_mobile/src/model/usuario.dart';
import 'dart:convert' as convert;

class UsuarioDao {
  Usuario user;

  UsuarioDao();

  static Usuario fromJson(Map<String, dynamic> json) {
    String login = json['login'];
    String nome = json['nome'];
    String email = json['email'];
    String urlFoto = json['urlFoto'];
    String token = json['token'];
    List<String> roles =
        json['roles'] != null ? json['roles'].cast<String>() : null;
    String senha = json['senha'];
    Usuario user = new Usuario(
        login: login, nome: nome, email: email, urlFoto: urlFoto, token: token, roles: roles, senha: senha);
    return user;
  }

  Map<String, dynamic> toJson(Usuario user) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = user.login;
    data['nome'] =  user.nome;
    data['email'] = user.email;
    data['urlFoto'] = user.urlFoto;
    data['token'] = user.token;
    data['roles'] = user.roles;
    data['senha'] = user.senha;
    return data;
  }

  static void clear() {
    print("Limpando 1");
    Prefs.setString("user.prefs", "");
  }

  void save(Usuario user) {
    this.user = user;
    Map map = toJson(user);

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Usuario user = fromJson(map);
    return user;
  }
}
