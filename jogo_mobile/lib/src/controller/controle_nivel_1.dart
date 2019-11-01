import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/business/nivel01Business.dart';
import 'package:jogo_mobile/src/enums/enumsBusinessNivel01.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/servicesFase1.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/alertaValidarClasse.dart';

class ControleNivel01 extends ChangeNotifier {
  List<String> listaDeClassesAtributos = [];
  List<String> listaDeAtributos = [];
  List<String> listaDeAtributosEscolhidos = [];
  List<String> listaDeMetodosEscolhidos = [];

  ServiceNivel01 _servicesNivel01;
  Nivel01Business nivel01business;
  ClasseGenerica classeGenerica;
  // numero do problema que o jogador está respondendo
  int numeroDoProblema;
  int pontuacaoAtualDoJogador;
  int pontoPorPartida;
  int scoreTotal;

  ControleNivel01() {
    this._servicesNivel01 = ServiceNivel01.getUnicaInstanciaServiceNivel01();
    this.nivel01business = Nivel01Business();
    this.pontoPorPartida = 0;
    this.numeroDoProblema = 1;
    this.scoreTotal =0;
  }

  ClasseGenerica retornaClasseDaRodada() {
    this.classeGenerica = _servicesNivel01.retornaClasseDaRodada();
    this.pontoPorPartida = 0;
    return this.classeGenerica;
  }

  addAtributoEscolhido(String atributo) {
    bool retorno = this.nivel01business.addAtributoNaListaDaRodada(atributo);
    if (retorno) {
      this.listaDeAtributosEscolhidos =
          this._servicesNivel01.listaDeAtributosEscolhidos;
      incrementarPontosDaRodada();
      notifyListeners();
    }
  }

  // Metodo que vai ser transmitido entre views;
  addMetodoEscolhidoPorJogador(String metodo) {
    bool retorno = this.nivel01business.addMetodoNaListaDaRodada(metodo);
    if (retorno) {
      this.listaDeMetodosEscolhidos =
          this._servicesNivel01.listaDeMetodosEscolhidos;
      incrementarPontosDaRodada();
      notifyListeners();
    }
  }

  removerAtributoEscolhido(String atributo2) {
    this._servicesNivel01.removerAtributoNaListaDaRodada(atributo2);
  }

  removerMetodoEscolhidoPorJogador(String metodo) {
    this._servicesNivel01.removerMetodoNaListaDaRodada(metodo);
  }

  listaAtributosColuna01() {
    return this._servicesNivel01.listaDeButoesAtributosColuna1;
  }

  listaAtributosColuna02() {
    return this._servicesNivel01.listaDeButoesAtributosColuna2;
  }

  listaMetodosColuna01() {
    return this._servicesNivel01.listaDeButoesMetodosColuna1;
  }

  listaMetodosColuna02() {
    return this._servicesNivel01.listaDeButoesMetodosColuna2;
  }

  //validar atributos e métodos
  validarClasse(BuildContext context, Function funcao) {
    EnumsValidacaoDeClasse enumsValidacaoDeClasse =
        this.nivel01business.validarClasse();

    if (enumsValidacaoDeClasse ==
        EnumsValidacaoDeClasse.atributoEmetodoCorreto) {
      String msg = enumMsgDeValidacaoDeClasse(enumsValidacaoDeClasse);
      String tituloMsg = "  Parabéns";
      String pontos= this.pontoPorPartida.toString();
      alertClasseCorreta(context, msg, tituloMsg, pontos, funcao);
      this.numeroDoProblema++;
      this.scoreTotal += this.pontoPorPartida;
    } else {
      String msg = enumMsgDeValidacaoDeClasse(enumsValidacaoDeClasse);
      String tituloMsg = "  Ops...";
      alertClasseIncorreta(context, msg, tituloMsg);
    }
  }

  incrementarPontosDaRodada() {
    this.pontoPorPartida = this.nivel01business.incrementarPontos();
    //  notifyListeners();
  }
}
