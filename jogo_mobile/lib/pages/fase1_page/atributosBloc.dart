import 'package:flutter/material.dart';

class TransferirdadosDaClasseBloc extends ChangeNotifier {
 
  String atributo;
  List<String> listaDeAtributos;

  tranferirAtributo(String atributo) {
    this.atributo = atributo;
    notifyListeners();
  }

  tranferirListaDeAtributos(List<String> listaDeAtributos) {
    this.listaDeAtributos = listaDeAtributos;
    notifyListeners();
  }
}
