import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/servicesFase1.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/alertaVerificarAtributos.dart';

class ControleNivel01 extends ChangeNotifier {
  List<String> listaDeClassesAtributos = [];
  List<String> listaDeAtributos = [];
  // Metodo que vai ser transmitido entre views;
  String metodoEscolhido;
  String atributoEscolhido;
  String atributoRemovido;

  ServiceNivel01 _servicesNivel01;
  ClasseGenerica classeGenerica;

  ControleNivel01() {
    this._servicesNivel01 = ServiceNivel01.getUnicaInstanciaServiceNivel01();
  }

  ClasseGenerica retornaClasseDaRodada() {
    this.classeGenerica = _servicesNivel01.retornaClasseDaRodada();
    return this.classeGenerica;
  }

  tranferirAtributos(List<String> listaDeClassesAtributos) {
    this.listaDeClassesAtributos = listaDeClassesAtributos;
    notifyListeners();
  }

  // transferirMetodo(String metodo) {
  //   this.metodoEscolhido = metodo;
  //   notifyListeners();
  // }

  addAtributoEscolhido(String atributo) {
    bool retorno = this._servicesNivel01.addAtributoNaListaDaRodada(atributo);
    if (retorno) {
      debugPrint("Atribuindo valor: ${atributo}");
      this.atributoEscolhido = atributo;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  removerAtributoEscolhido(String atributo) {
    bool retorno =
        this._servicesNivel01.removerAtributoNaListaDaRodada(atributo);
    if (retorno) {
      this.atributoRemovido = atributo;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  // Metodo que vai ser transmitido entre views;
  addMetodoEscolhidoPorJogador(String metodo) {
    bool retorno = this._servicesNivel01.addMetodoNaListaDaRodada(metodo);
    if (retorno) {
      this.metodoEscolhido = metodo;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  removerMetodoEscolhidoPorJogador(String metodo) {
    this._servicesNivel01.removerMetodoNaListaDaRodada(metodo);
  }

  esvaziarLista() {
    this.listaDeClassesAtributos.clear();
  }

  limparStringAtributo() {
    this.atributoEscolhido = "";
    this.atributoRemovido = "";
  }

  limparStringMetodo() {
    this.metodoEscolhido = "";
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

  //verificar se atributo ja foi inserido
  getIsAtributoJaEscolhido(String nomeAtributo) {
    var lista = this._servicesNivel01.listaDeAtributosEscolhidos;
    return lista.contains(nomeAtributo);
  }

  //verificar se metodo ja foi inserido
  getIsMetodoJaEscolhido(String nomeMetodo) {
    var lista = this._servicesNivel01.listaDeMetodosEscolhidos;
    return lista.contains(nomeMetodo);
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
