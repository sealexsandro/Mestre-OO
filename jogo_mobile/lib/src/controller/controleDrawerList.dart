import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/dao/FirebaseServices.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';

class ControleDrawerList {
  // Metodo Para logout do usuario

  Fachada fachada;
  ControleDrawerList() {
    this.fachada = Fachada.getUnicaInstanciaFachada();
  }

  onclickLogout(context) {
    // Usuario.clear();
    //  UsuarioDao.clear();
    fachada.limparPrefers();
  //  FirebaseService().logout();

    Navigator.pop(context);
    Navigator.popAndPushNamed(context, "/");
  }
}
