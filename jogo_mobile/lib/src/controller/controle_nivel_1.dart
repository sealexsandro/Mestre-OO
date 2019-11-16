import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/enums/enumsBusinessNivel01.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/alertaValidarClasse.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/nivel_1.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class ControleNivel01 extends ChangeNotifier {
  final String listAtribColumn01 = "atributosColumn01";
  final String listAtribColumn02 = "atributosColumn02";
  final String listMetodosColumn01 = "metodosColumn01";
  final String listMetodosColumn02 = "metodosColumn02";

  List<String> listaDeAtributosEscolhidos = [];
  List<String> listaDeMetodosEscolhidos = [];
  BuildContext context;

  ClasseTemplate classeTemplate;
  TipoDeProblema tipoDeProblema;
  // numero do problema que o jogador está respondendo
  int numeroDoProblema;
  int pontuacaoAtualDoJogador;
  int pontoPorPartida;
  int scoreTotal;
  Fachada fachada;

  ControleNivel01();

  iniciarTelaNivel01(context, tipoDeProblema) {
    this.fachada = new Fachada();
    this.fachada.startServicesNivel01(tipoDeProblema);
    this.context = context;
    this.tipoDeProblema = tipoDeProblema;
    this.listaDeAtributosEscolhidos =
        this.fachada.listaAtributosOuMetodosEscolhidos("atributo");
    this.listaDeMetodosEscolhidos =
        this.fachada.listaAtributosOuMetodosEscolhidos("metodo");
    this.pontoPorPartida = this.fachada.nivel01Business.pontucaoDaRodada;
    this.numeroDoProblema = 1;
    this.scoreTotal = 0;
    nextScreen(this.context, Nivel01(this));
    print("Instanciando controle");
  }

  ClasseTemplate retornaClasseDaRodada() {
    this.classeTemplate = fachada.retornaClasseDaRodada();
    return this.classeTemplate;
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

  listaConteudoDosBotoes(String listaRequerida) {
    return this.fachada.listaConteudoDosBotoes(listaRequerida);
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
      alertClasseCorreta(context, msg, tituloMsg, pontos, funcao);
      this.numeroDoProblema++;
      this.scoreTotal += this.pontoPorPartida;
      notifyListeners();
    } else {
      String msg = enumMsgDeValidacaoDeClasse(enumsValidacaoDeClasse);
      String tituloMsg = "  Ops...";
      alertClasseIncorreta(context, msg, tituloMsg);
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
