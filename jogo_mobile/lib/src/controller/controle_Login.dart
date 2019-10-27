import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/dao/FirebaseServices.dart';
import 'package:jogo_mobile/src/model/ApiResponse.dart';

class ControleLogin {
  final _streamController = StreamController<bool>();
  get stream => _streamController.stream;


  onPressedEntrar(String login, String senha){
    
  }


  Future<ApiResponse> login(String login, String senha) async {

    _streamController.add(true);

//    ApiResponse response = await LoginApi.login(login, senha);
    ApiResponse response = await FirebaseService().login(login, senha);

    _streamController.add(false);

    return response;
  }

  void dispose() {
    _streamController.close();
  }
}