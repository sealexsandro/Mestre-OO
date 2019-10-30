import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/business/nivel01Business.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/servicesFase1.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/alertaVerificarAtributos.dart';

class ControleNivel01 extends ChangeNotifier {
  List<String> listaDeClassesAtributos = [];
  List<String> listaDeAtributos = [];
  List<String> listaDeAtributosEscolhidos = [];
  List<String> listaDeMetodosEscolhidos = [];

  ServiceNivel01 _servicesNivel01;
  Nivel01Business nivel01business;
  ClasseGenerica classeGenerica;

  ControleNivel01() {
    this._servicesNivel01 = ServiceNivel01.getUnicaInstanciaServiceNivel01();
    this.nivel01business = Nivel01Business();
  }

  ClasseGenerica retornaClasseDaRodada() {
    this.classeGenerica = _servicesNivel01.retornaClasseDaRodada();
    return this.classeGenerica;
  }

  addAtributoEscolhido(String atributo) {
    bool retorno = this.nivel01business.addAtributoNaListaDaRodada(atributo);
    if (retorno) {
      this.listaDeAtributosEscolhidos =
          this._servicesNivel01.listaDeAtributosEscolhidos;
      notifyListeners();
    }
  }

  // Metodo que vai ser transmitido entre views;
  addMetodoEscolhidoPorJogador(String metodo) {
    bool retorno = this.nivel01business.addMetodoNaListaDaRodada(metodo);
    if (retorno) {
      this.listaDeMetodosEscolhidos =
          this._servicesNivel01.listaDeMetodosEscolhidos;
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
  validarClasse(BuildContext context) {
    bool verificacaoAtributos =
        this._servicesNivel01.validarAtributosEscolhidos();
    bool verificacaoMetodos = this._servicesNivel01.validarMetodosEscolhidos();
    String mensagem;
    String tituloMsgIsInCorreto = "  Opa... ";
    String tituloMsgIsCorreto = "  Parabéns ";

    if (verificacaoAtributos == false && verificacaoMetodos == false) {
      mensagem =
          "Você errou alguma coisa, verifique os atributos e métodos escolhidos";
      var icone = Icon(
        Icons.report,
        color: Colors.red,
        size: 30,
      );

      alertVerificarClasse(context, mensagem, tituloMsgIsInCorreto, icone);
      debugPrint("Vericacao de atributos e metodos");
      return false;
    } else if (!verificacaoAtributos) {
      mensagem = "Você errou alguma coisa, verifique os atributos escolhidos";
      var icone = Icon(
        Icons.report,
        color: Colors.red,
        size: 30,
      );
      alertVerificarClasse(context, mensagem, tituloMsgIsInCorreto, icone);
      debugPrint("Vericacao de atributos ");
      return false;
    } else if (!verificacaoMetodos) {
      mensagem = "Você errou alguma coisa, verifique os métodos escolhidos";
      var icone = Icon(
        Icons.report,
        color: Colors.red,
        size: 30,
      );

      alertVerificarClasse(context, mensagem, tituloMsgIsInCorreto, icone);
      debugPrint("Vericacao de  metodos");
      return false;
    } else {
      mensagem = "Muito bem, vamos para próxima classe";
      this._servicesNivel01.limparListaDeAtributosMetodos();

      var icone = Icon(
        Icons.mood,
        color: Colors.blueAccent[400],
        size: 30,
      );
      alertVerificarClasse(context, mensagem, tituloMsgIsCorreto, icone);
      return true;
    }
  }
}
