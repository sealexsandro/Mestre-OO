import 'package:jogo_mobile/src/model/servicesFase1.dart';

class Nivel01Business {
  ServiceNivel01 _servicesNivel01;
  // Atributos que serão escolhidos pelo jogador
  List<String> listaDeAtributosEscolhidos = [];

  // Metodos que serão escolhidos pelo jogador
  List<String> listaDeMetodosEscolhidos = [];

  Nivel01Business() {
    _servicesNivel01 = ServiceNivel01.getUnicaInstanciaServiceNivel01();
  }

  //Validar se o atributo poderá ser adicionado
  addAtributoNaListaDaRodada(String atributo) {
    this.listaDeAtributosEscolhidos =
        this._servicesNivel01.listaDeAtributosEscolhidos;
    if (this.listaDeAtributosEscolhidos.length > 0) {
      bool atributoRepetido = false;
      for (var i = 0; i < this.listaDeAtributosEscolhidos.length; i++) {
        if (this.listaDeAtributosEscolhidos[i] == atributo) {
          atributoRepetido = true;
        }
      }
      if (atributoRepetido == false) {
        this._servicesNivel01.addAtributoNaListaDaRodada(atributo);
        return true;
      } else {
        return false;
      }
    } else {
      this._servicesNivel01.addAtributoNaListaDaRodada(atributo);
      return true;
    }
  }

  // Validar se o método poderá ser adicionado
  addMetodoNaListaDaRodada(String metodo) {
    this.listaDeMetodosEscolhidos =
        this._servicesNivel01.listaDeMetodosEscolhidos;
    if (this.listaDeMetodosEscolhidos.length > 0) {
      if (this.listaDeMetodosEscolhidos.contains(metodo)) {
        return false;
      } else {
        this._servicesNivel01.addMetodoNaListaDaRodada(metodo);
        return true;
      }
    } else {
      this._servicesNivel01.addMetodoNaListaDaRodada(metodo);
      return true;
    }
  }
}
