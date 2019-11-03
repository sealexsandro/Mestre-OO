import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/dao/FirebaseServices.dart';
import 'package:jogo_mobile/src/model/usuario.dart';

class ControleDrawerList {

  // Metodo Para logout do usuario
  onclickLogout(context) {
    Usuario.clear();
    FirebaseService().logout();
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, "/");
  }
}
