import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/enums/enumsBusinessNivel01.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';
import 'package:jogo_mobile/src/model/PontosJogador.dart';
import 'package:jogo_mobile/src/model/usuario.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/EscolhaDeProblemasNivel01.dart';
import 'package:jogo_mobile/src/pages/LicaoConcluida/licaoConcluida.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/alertaValidarClasse.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/nivel_1.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class ControleNivel01 extends ChangeNotifier {
  List<String> listaDeAtributosEscolhidos = [];
  List<String> listaDeMetodosEscolhidos = [];
  BuildContext context;

  ClasseTemplate classeTemplate;
  TipoDeProblema tipoDeProblema;
  // numero do problema que o jogador está respondendo
  int numeroDoProblema;
  int pontuacaoAtualDoJogador;
  int pontoPorPartida;
  int scoreTotal = 0;
  String scoreCompletoDeTodoJogo = "";
  Fachada fachada;
  Future<Usuario> userFuture;

  ControleNivel01() {
    this.fachada = Fachada.getUnicaInstanciaFachada();
  }

  iniciarTelaNivel01(context, tipoDeProblema) {
    this.fachada.startServicesNivel01(tipoDeProblema);
    this.context = context;
    this.tipoDeProblema = tipoDeProblema;
    this.listaDeAtributosEscolhidos =
        this.fachada.listaAtributosOuMetodosEscolhidos("atributo");
    this.listaDeMetodosEscolhidos =
        this.fachada.listaAtributosOuMetodosEscolhidos("metodo");
    this.pontoPorPartida = this.fachada.nivel01Business.pontucaoDaRodada;
    this.numeroDoProblema = 1;
    //  atualizarScore();

    nextScreen(this.context, Nivel01(this));

    print("Instanciando controle");
  }

  ClasseTemplate retornaClasseDaRodada() {
    this.classeTemplate = fachada.retornaClasseDaRodada();
    this.pontoPorPartida = 0;
    if (this.classeTemplate != null) {
      return this.classeTemplate;
    } else {
      return null;
    }
  }

  atualizarScore() {
    userFuture = fachada.getUsuario();

    userFuture.then((Usuario user) {
      if (user != null) {
        Future<PontosJogador> pontosJogFuture = PontosJogador.load(user.email);
        pontosJogFuture.then((PontosJogador pontosJog) {
          if (pontosJog != null) {
            print("Pontos do jogador: ${pontosJog.pontos.toString()}");
            this.scoreTotal = pontosJog.pontos;
            notifyListeners();
          }
        });
      }
    });
  }

  exibirTelaLicaoConcluida(BuildContext context) {
    userFuture = fachada.getUsuario();
    userFuture.then((Usuario user) {
      if (user != null) {
        this.scoreTotal += 20;
        PontosJogador pontosJogador =
            new PontosJogador(pontos: scoreTotal, loginJogador: user.email);
        PontosJogador.salvar(pontosJogador);
      }
    });
    return nextScreen(context, LicaoConcluida());
  }

  exibirTelaEscolhaDeSistemas() {
    nextScreen(this.context, EscolhaDeProblemasNivel01());
  }

  addAtributoEscolhido(String atributo) {
    bool retorno =
        this.fachada.nivel01Business.addAtributoNaListaDaRodada(atributo);
    if (retorno) {
      incrementarPontosDaRodada("atributo");
      notifyListeners();
    } else {
      this.listaDeAtributosEscolhidos.remove(atributo);
      this.decrementarPontosDaRodada("atributo");
      notifyListeners();
    }
  }

  // Metodo que vai ser transmitido entre views;
  addMetodoEscolhidoPorJogador(String metodo) {
    bool retorno =
        this.fachada.nivel01Business.addMetodoNaListaDaRodada(metodo);
    if (retorno) {
      // this.listaDeMetodosEscolhidos =
      //     this._servicesNivel01.listaDeMetodosEscolhidos;
      incrementarPontosDaRodada("metodo");
      notifyListeners();
    } else {
      this.listaDeMetodosEscolhidos.remove(metodo);
      this.decrementarPontosDaRodada("metodo");
      notifyListeners();
    }
  }

  removerAtributoOuMetodoEscolhido(String tipoDeItem, String item) {
    return this.fachada.removerAtributoOuMetodoEscolhido(tipoDeItem, item);
  }

  listaConteudoDosBotoes(enumListasAuxiliares enumListaAuxiliar) {
    return this.fachada.listaConteudoDosBotoes(enumListaAuxiliar);
  }

  //validar atributos e métodos
  validarClasse(BuildContext context, Function funcao) {
    EnumsValidacaoDeClasse enumsValidacaoDeClasse =
        this.fachada.validarClasse();

    if (enumsValidacaoDeClasse ==
        EnumsValidacaoDeClasse.atributoEmetodoCorreto) {
      String msg = enumMsgDeValidacaoDeClasse(enumsValidacaoDeClasse);
      String tituloMsg = "  Parabéns";
      String pontos = this.pontoPorPartida.toString();
      msg += " " + pontos + " pontos.";
      //  alertClasseCorreta(context, msg, tituloMsg, pontos, funcao);
      msgAvisoAcertouTudo(
          context, NomeIcone.ganhouRodada, tituloMsg, msg, funcao);

      this.numeroDoProblema++;
      this.scoreTotal += this.pontoPorPartida;
      notifyListeners();
    } else {
      String msg = enumMsgDeValidacaoDeClasse(enumsValidacaoDeClasse);
      String tituloMsg = "  Ops...";
      //  alertClasseIncorreta(context, msg, tituloMsg);
      msgAvisoQntMinimaAtribMet(
          context, NomeIcone.qntMinimaAtribMet, tituloMsg, msg);
    }
  }

  incrementarPontosDaRodada(String tipoDeIncrementacao) {
    this.pontoPorPartida =
        this.fachada.incrementarPontosDaRodada(tipoDeIncrementacao);
    notifyListeners();
  }

  decrementarPontosDaRodada(String tipoDeDecrementacao) {
    this.pontoPorPartida =
        this.fachada.decrementarPontosDaRodada(tipoDeDecrementacao);
    notifyListeners();
  }
}
