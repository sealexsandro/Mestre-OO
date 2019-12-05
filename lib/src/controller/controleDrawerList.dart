import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/pages/Login/login.dart';
import 'package:jogo_mobile/src/pages/editarUser/configuracoesDaConta.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class ControleDrawerList {
  // Metodo Para logout do usuario

  Fachada fachada;
  ControleDrawerList() {
    this.fachada = Fachada.getUnicaInstanciaFachada();
  }

  telaDeConfiguracoes(BuildContext context) {
       nextScreen(context, ConfigContaUser());
  }

  onclickLogout(context) {
    fachada.limparPrefers();
    pushReplacement(context, Login());
  }
}
