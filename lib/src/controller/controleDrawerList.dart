import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/pages/Login/login.dart';
import 'package:jogo_mobile/src/pages/editarUser/configuracoesDaConta.dart';
import 'package:jogo_mobile/utils/navegacao.dart';
import 'package:provider/provider.dart';

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
    Provider.of<ControleNivel01>(context, listen: false).scoreTotal = 0;
    pushReplacement(context, Login());
  }
}
