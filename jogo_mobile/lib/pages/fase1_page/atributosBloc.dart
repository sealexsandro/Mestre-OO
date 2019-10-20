import 'package:flutter/material.dart';
import 'package:jogo_mobile/model/ClasseGenerica.dart';
import 'package:jogo_mobile/model/atributosDasClasses.dart';
import 'package:jogo_mobile/model/bo/servicesFase1.dart';

class TransferirdadosDaClasseBloc extends ChangeNotifier {
  List<String> listaDeClassesAtributos = [];
  List<String> listaDeAtributos =[];
  ServiceFase1 _services;
  ClasseGenerica classeGenerica;

  TransferirdadosDaClasseBloc() {
    this._services = new ServiceFase1();
  }

  ClasseGenerica retornaClasseDaRodada() {
    this.classeGenerica = _services.retornaClasseDaRodada();
    return this.classeGenerica;
  }

  tranferirAtributos(List<String> listaDeClassesAtributos) {
    this.listaDeClassesAtributos = listaDeClassesAtributos;
    notifyListeners();
  }

  esvaziarLista() {
    this.listaDeClassesAtributos.clear();
  }

}
