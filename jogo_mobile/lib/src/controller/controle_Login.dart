import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/dao/FirebaseServices.dart';
import 'package:jogo_mobile/src/model/ApiResponse.dart';
import 'package:jogo_mobile/src/pages/utilsPages/alertNotificacao.dart';

class ControleLogin {
  final _streamController = StreamController<bool>();
  get stream => _streamController.stream;

  // Verificar login do usuario
  Future<Response> login(context, login, senha) async {
    _streamController.add(true);
    Response response = await FirebaseService().login(login, senha);
    _streamController.add(false);

    if (response.ok) {
      //  await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, "/EscolhaDeNivel");
    } else {
      alertNotificacao(context, response.msg);
      debugPrint("Acesso negado");
    }

    return response;
  }

  loginComFirebase(context) async {
    final service = FirebaseService();
    Response response = await service.loginGoogle();

    if (response.ok) {
      Navigator.pushNamed(context, "/EscolhaDeNivel");
    } else {
      alertNotificacao(context, response.msg);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
