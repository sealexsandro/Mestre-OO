
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:provider/provider.dart';

class ControleTelaProblemasNivel01{
  BuildContext context;

  ControleTelaProblemasNivel01(this.context);

  nextScreen(TipoDeProblema tipoDeProblema){
    ControleNivel01 controleNivel01 = Provider.of<ControleNivel01>(context, listen: false);
    controleNivel01.iniciarTelaNivel01(this.context, tipoDeProblema);
  }

}