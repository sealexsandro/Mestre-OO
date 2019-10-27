import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/atributosDasClasses.dart';
import 'package:jogo_mobile/src/model/metodosDasClasses.dart';

class ServiceNivel01 {
  List<EnumsNomesDeClasses> listaNomesDeClasses = [];
  Random random = Random();
  // Metodos que serão escolhidos pelo jogador
  List<String> listaDeMetodosEscolhidos = [];

  // Atributos que serão escolhidos pelo jogador
  List<String> listaDeAtributosEscolhidos = [];

  // Atributos da coluna 1 da caixa de Dialog
  List<String> listaDeButoesAtributosColuna1 = [];

  // Atributos  da coluna 2 da caixa de Dialog
  List<String> listaDeButoesAtributosColuna2 = [];

  // Metodos da coluna 1 da caixa de Dialog
  List<String> listaDeButoesMetodosColuna1 = [];

  // Metodos da coluna 2 da caixa de Dialog
  List<String> listaDeButoesMetodosColuna2 = [];

  // Lista de Atributos Verdadeiros
  List<String> listaDeAtributosVerdadeiros = [];

  // Lista de Medotos Verdadeiros
  List<String> listaDeMetodosVerdadeiros = [];

  //Enum com o nome da classe escolhida para a rodada;
  EnumsNomesDeClasses enumsNomesDeClasses;

  ServiceNivel01() {
    iniciarLista();
  }

  iniciarLista() {
    listaNomesDeClasses = [];
    EnumsNomesDeClasses.values.forEach((nomeDaClasse) {
      listaNomesDeClasses.add(nomeDaClasse);
    });
  }

  addAtributoNaListaDaRodada(String atributo) {
    if (this.listaDeAtributosEscolhidos.length > 0) {
      bool atributoRepetido = false;
      for (var i = 0; i < this.listaDeAtributosEscolhidos.length; i++) {
        if (this.listaDeAtributosEscolhidos[i] == atributo) {
          atributoRepetido = true;
        }
      }
      if (atributoRepetido == false) {
        this.listaDeAtributosEscolhidos.add(atributo);
        return true;
      } else {
        return false;
      }
    } else {
      this.listaDeAtributosEscolhidos.add(atributo);
      return true;
    }
  }

  removerAtributoNaListaDaRodada(String atributo) {
    if (atributo != null) {
      if (this.listaDeAtributosEscolhidos.length > 0) {
        this.listaDeAtributosEscolhidos.removeWhere((item) => item == atributo);
        return true;
      } else {
        return false;
      }
    }
  }

  ////////////////////////////////////////////////
  addMetodoNaListaDaRodada(String metodo) {
    if (this.listaDeMetodosEscolhidos.length > 0) {
      bool metodoRepetido = false;
      for (var i = 0; i < this.listaDeMetodosEscolhidos.length; i++) {
        if (this.listaDeMetodosEscolhidos[i] == metodo) {
          metodoRepetido = true;
        }
      }
      if (metodoRepetido == false) {
        this.listaDeMetodosEscolhidos.add(metodo);
        return true;
      } else {
        return false;
      }
    } else {
      this.listaDeMetodosEscolhidos.add(metodo);
      return true;
    }
  }

  removerMetodoNaListaDaRodada(String metodo) {
    if (metodo != null) {
      if (this.listaDeMetodosEscolhidos.length > 0) {
        this.listaDeMetodosEscolhidos.removeWhere((item) => item == metodo);
      } else {
        //tratar essa excessão
      }
    }
  }

  retornaClasseDaRodada() {
    //Iniciar toda as listas para necessárias para a classe escolhida
    this.listaDeMetodosEscolhidos = [];
    this.listaDeAtributosEscolhidos = [];
    this.listaDeButoesAtributosColuna1 = [];
    this.listaDeButoesAtributosColuna2 = [];
    this.listaDeButoesMetodosColuna1 = [];
    this.listaDeButoesMetodosColuna2 = [];
    this.listaDeAtributosVerdadeiros = [];
    this.listaDeMetodosVerdadeiros = [];
    //////////////////////////////////////////////////////////////////////
    //Pegando o enum nome da classe
    this.listaNomesDeClasses.shuffle();
    int randomNumber = random.nextInt(listaNomesDeClasses.length);
    EnumsNomesDeClasses enumNomeDaClasse = listaNomesDeClasses[randomNumber];
    this.listaNomesDeClasses.remove(randomNumber);
    //Pegando o nome da classe abaixo
    var nomeDaClasse =
        NomesGenericosParaClasses.getNomesGenericoDeClasse(enumNomeDaClasse);
    //Pegando o nome do Sistema abaixo
    var nomeDoSistema =
        NomesGenericosParaClasses.getNomesDoSistema(enumNomeDaClasse);

    buscarAtributosMetodosDaClasse(enumNomeDaClasse);

    //////////////////////////////////////////////////////////////////////////////
    ClasseGenerica classeGenerica = new ClasseGenerica(
      enumNomeDaClasse: enumNomeDaClasse,
      nomeDaClasse: nomeDaClasse,
      nomeDoProblema: nomeDoSistema,
      // listaDeAtributosVerdadeiros: listaDeAtributosVerdadeiros,
      // listaDeAtributosVariados: listaDeAtributosMisturados,
      // listaDeMetodosVerdadeiros: listaDeMetodosVerdadeiros,
      // listaDeMetodosVariados: listaDeMetodosMisturados,
    );

    return classeGenerica;
  }

  buscarAtributosMetodosDaClasse(EnumsNomesDeClasses enumNomeDaClasse) {
    //Buscando atributos verdadeiros e falsos
    this.listaDeAtributosVerdadeiros =
        AtributosDeClasseCorretos.getAtributosCorretos(enumNomeDaClasse);
    List<String> listaDeAtributosFalsos =
        AtributosDeClasseIncorretos.getAtributosIncorretos(enumNomeDaClasse);

    listaDeAtributosVerdadeiros.shuffle();
    listaDeAtributosFalsos.shuffle();
    List<String> listaDeAtributosMisturados =
        listaMisturada(listaDeAtributosVerdadeiros, listaDeAtributosFalsos);
    // Preenchendo as colunas com atributos
    preenchendoListasColunasAtributos(listaDeAtributosMisturados);
    //Buscando métodos verdadeiros e falsos
    this.listaDeMetodosVerdadeiros =
        MetodosDeClasseCorretos.getMetodosCorretos(enumNomeDaClasse);
    List<String> listaDeMetodosFalsos =
        MetodosDeClasseIncorretos.getMetodosIncorretos(enumNomeDaClasse);
    listaDeMetodosVerdadeiros.shuffle();
    listaDeMetodosFalsos.shuffle();
    List<String> listaDeMetodosMisturados =
        listaMisturada(listaDeMetodosVerdadeiros, listaDeMetodosFalsos);
    // Preenchendo as colunas com metodos
    preenchendoListasColunasMetodos(listaDeMetodosMisturados);
  }

  List<String> listaMisturada(
      List<String> listaVerdadeira, List<String> listaFalsa) {
    List<String> listaMisturada = [];

    if (listaVerdadeira.length > 0 && listaFalsa.length > 0) {
      int cont = 0;
      for (var i = 0; i < 8; i++) {
        if (i < 4 && listaVerdadeira.length > i) {
          //Preenchendo com atributos Corretos da classe escolhida
          listaMisturada.add(listaVerdadeira[i]);
        } else if (i >= 4 && listaFalsa.length > cont) {
          //Preenchendo com atributos Incorretos para classe escolhida
          listaMisturada.add(listaFalsa[cont]);
          cont++;
        }
      }
    }
    return listaMisturada;
  }

  void preenchendoListasColunasAtributos(List<String> listaDeButoesMisturados) {
    listaDeButoesMisturados.shuffle();
    if (listaDeButoesMisturados.length > 0) {
      for (var i = 0; i < listaDeButoesMisturados.length; i++) {
        if (i < 4) {
          //Preenchendo com atributos
          this.listaDeButoesAtributosColuna1.add(listaDeButoesMisturados[i]);
        } else {
          //Preenchendo com atributos
          this.listaDeButoesAtributosColuna2.add(listaDeButoesMisturados[i]);
        }
      }
    } else {
      debugPrint("Valores não Inseridos");
    }
  }

  void preenchendoListasColunasMetodos(List<String> listaDeButoesMisturados) {
    listaDeButoesMisturados.shuffle();
    if (listaDeButoesMisturados.length > 0) {
      for (var i = 0; i < listaDeButoesMisturados.length; i++) {
        if (i < 4) {
          //Preenchendo com métodos
          this.listaDeButoesMetodosColuna1.add(listaDeButoesMisturados[i]);
        } else {
          //Preenchendo com  metodos
          this.listaDeButoesMetodosColuna2.add(listaDeButoesMisturados[i]);
        }
      }
    } else {
      debugPrint("Valores não Inseridos");
    }
  }

  //Validar atributos escolhidos
  validarAtributosEscolhidos() {
    for (var i = 0; i < this.listaDeAtributosEscolhidos.length; i++) {
      if (this
              .listaDeAtributosVerdadeiros
              .contains(this.listaDeAtributosEscolhidos[i]) ==
          false) {
        return false;
      }
    }
    return true;
  }

  //Validar metodos escolhidos
  validarMetodosEscolhidos() {
    for (var i = 0; i < this.listaDeMetodosEscolhidos.length; i++) {
      if (this
              .listaDeMetodosVerdadeiros
              .contains(this.listaDeMetodosEscolhidos[i]) ==
          false) {
        return false;
      }
    }
    return true;
  }
}
