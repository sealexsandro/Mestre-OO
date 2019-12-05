import 'package:flutter/cupertino.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/EscolhaDeProblemasNivel01.dart';
import 'package:jogo_mobile/src/pages/Login/login.dart';
import 'package:jogo_mobile/src/pages/utilsPages/alertNotificacao.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class ControleSignUp {
  Fachada fachada;
  ControleSignUp() {
    this.fachada = Fachada.getUnicaInstanciaFachada();
  }

  salvarUsuario(BuildContext context, nome, email, senha, senhaRepetida) async{
    if (senha.toString().length < 6) {
      alertNotificacao(context, "A senha deve ter no mínimo 6 dígitos!");
      return;
    }
    if (senha != senhaRepetida) {
      alertNotificacao(context, "A senha devem ser Iguais");
      return;
    }
    final response = await fachada.salvarUsuario(nome, email, senha);

    if (response.ok) {
      //   Navigator.pushNamed(context, "/EscolhaDeNivel");
      pushReplacement(context, EscolhaDeProblemasNivel01());
    } else {
      alertNotificacao(context, response.msg);
    }
  }
}
