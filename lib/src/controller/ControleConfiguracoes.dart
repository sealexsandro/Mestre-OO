import 'package:flutter/cupertino.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/pages/editarUser/alerta.dart';
import 'package:jogo_mobile/src/pages/utilsPages/alertNotificacao.dart';

class ControleConfiguracoes {
  Fachada fachada;
  ControleConfiguracoes() {
    this.fachada = Fachada.getUnicaInstanciaFachada();
  }

  atualizarUsuario(
      BuildContext context,
      int tipoAtualizacao,
      String emailAntigo,
      String emailNovo,
      String nomeAntigo,
      String nomeNovo,
      String senhaAntiga,
      String senhaNova) async {
    final response = await fachada.atualizarUser(tipoAtualizacao, emailAntigo,
        emailNovo, nomeAntigo, nomeNovo, senhaAntiga, senhaNova);
    if (response.ok) {
      alertaAtualizacao(context, mensagem: "Atualizado com Sucesso");
    } else {
      alertaAtualizacao(context, mensagem: response.msg);
    }
  }

  atualizarSenha(BuildContext context, String email, String senhaCerta,
      String senhaAntiga, String senhaNova) async {
        final response =
        await fachada.atualizarSenhaUser(email, senhaAntiga, senhaNova);
    if (response.ok) {
    //  Navigator.pop(context);
      alertaAtualizacao(context, mensagem: "Senha Atualizada");
    } else {
      alertaAtualizacao(context, mensagem: response.msg);
    }
  }
}
