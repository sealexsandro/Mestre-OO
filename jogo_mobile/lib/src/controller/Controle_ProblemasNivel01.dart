
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/dialogInfoSistema.dart';

class ControleTelaProblemasNivel01{
  BuildContext context;

  ControleTelaProblemasNivel01(this.context);

   dialogInformativo(TipoDeProblema tipoDeProblema) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          DialogInfoSistema(tipoDeProblema, this.context),
    );
  } 

}