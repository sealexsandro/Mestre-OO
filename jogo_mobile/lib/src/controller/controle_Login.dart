import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/model/usuario.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/EscolhaDeProblemasNivel01.dart';
import 'package:jogo_mobile/src/pages/utilsPages/alertNotificacao.dart';
import 'package:jogo_mobile/utils/Response.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class ControleLogin {
  final _streamController = StreamController<bool>();
  get stream => _streamController.stream;

  Fachada fachada;
  ControleLogin() {
    this.fachada = Fachada.getUnicaInstanciaFachada();
  }
  pegarUsuarioConectado(BuildContext context) {
    Future<Usuario> userFuture = fachada.getUsuario();
    userFuture.then((Usuario user) {
      if (user != null) {
        nextScreen(context, EscolhaDeProblemasNivel01());
      }
    });
  }

  buscarUsuarioAtivo(BuildContext context) {
    Future<Usuario> userFuture = fachada.getUsuario();
    userFuture.then((Usuario user) {
      if (user != null) {
        nextScreen(context, EscolhaDeProblemasNivel01());
      }
    });
  }

  // Verificar login do usuario
  Future<Response> login(context, login, senha) async {
    _streamController.add(true);
    Response response = await fachada.loginUser(login, senha);
    _streamController.add(false);

    if (response.ok) {
      //  await Future.delayed(Duration(seconds: 2));
      nextScreen(context, EscolhaDeProblemasNivel01());
    } else {
      alertNotificacao(context, response.msg);
    }
    return response;
  }

  loginComGoogle(context) async {
    final response = await fachada.loginComGoogle();
    if (response.ok) {
      nextScreen(context, EscolhaDeProblemasNivel01());
    } else {
      alertNotificacao(context, response.msg);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
