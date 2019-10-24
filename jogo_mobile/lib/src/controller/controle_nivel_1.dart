import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/servicesFase1.dart';


class ControleNivel01 extends ChangeNotifier {
  List<String> listaDeClassesAtributos = [];
  List<String> listaDeAtributos = [];
  // Metodo que vai ser transmitido entre views;
  String metodoEscolhido;

  ServiceNivel_1 _servicesNivel_1;
  ClasseGenerica classeGenerica;

  ControleNivel01() {
    this._servicesNivel_1 = new ServiceNivel_1();
  }

  ClasseGenerica retornaClasseDaRodada() {
    this.classeGenerica = _servicesNivel_1.retornaClasseDaRodada();
    return this.classeGenerica;
  }

  tranferirAtributos(List<String> listaDeClassesAtributos) {
    this.listaDeClassesAtributos = listaDeClassesAtributos;
    notifyListeners();
  }

  // Metodo que vai ser transmitido entre views;
  transferirMetodo(String metodo) {
    this.metodoEscolhido = metodo;
    notifyListeners();
  }

  AddMetodoNaListaDaRodada(String metodo) {
    this._servicesNivel_1.AddMetodoNaListaDaRodada(metodo);
  }

  removerMetodoNaListaDaRodada(String metodo) {
    this._servicesNivel_1.removerMetodoNaListaDaRodada(metodo);
  }

  esvaziarLista() {
    this.listaDeClassesAtributos.clear();
  }
}
