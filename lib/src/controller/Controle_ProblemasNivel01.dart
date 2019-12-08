import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/model/PontosJogador.dart';
import 'package:jogo_mobile/src/model/usuario.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/dialogInfoSistema.dart';

class ControleTelaProblemasNivel01 {
  BuildContext context;
  Fachada fachada;
  Future<Usuario> userFuture;

  ControleTelaProblemasNivel01(this.context) {
    this.fachada = Fachada.getUnicaInstanciaFachada();
    userFuture = fachada.getUsuario();
  }

  dialogInformativo(TipoDeProblema tipoDeProblema) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          DialogInfoSistema(tipoDeProblema, this.context),
    );
  }

  pegarPontuacaoJogador(){
  //    userFuture.then((Usuario user) {
  //     if (user != null) {
  //       print("Usuario não nulo controle problemas nivel1");
  //       Future<PontosJogador> pontosJogFuture = PontosJogador.load(user.email);
  //       pontosJogFuture.then((PontosJogador pontosJog) {
  //         if (pontosJog != null) {
  //           print("Pontos do jogador: ${pontosJog.pontos.toString()}");
  //           return pontosJog.pontos.toString();
  //         }
  //       });
  //     }
  //   });
  //   print("Usuario Nulo controle problemas nivel1");
   }
}
