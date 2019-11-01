import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/atributosDasClasses.dart';
import 'package:jogo_mobile/src/model/metodosDasClasses.dart';

class ServiceNivel01 {
  List<EnumsNomesDeClasses> listaNomesDeClasses = [];
  Random random = Random();

  // numero do problema que o jogador está respondendo
  int numeroDoProblema;

  int pontuacaoAtualDoJogador;

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

  ServiceNivel01._() {
    iniciarLista();
  }

  static ServiceNivel01 unicaInstanciaServiceNivel01;

  static ServiceNivel01 getUnicaInstanciaServiceNivel01() {
    if (unicaInstanciaServiceNivel01 == null)
      unicaInstanciaServiceNivel01 = new ServiceNivel01._();
    return unicaInstanciaServiceNivel01;
  }

  iniciarLista() {
    listaNomesDeClasses = [];
    EnumsNomesDeClasses.values.forEach((nomeDaClasse) {
      listaNomesDeClasses.add(nomeDaClasse);
    });
  }

  // Adicionar Atributo na lista de atributos escolhidos na rodada do jogo
  addAtributoNaListaDaRodada(String atributo) {
    debugPrint("Atributo adicionado: ${atributo.toString()}");
    this.listaDeAtributosEscolhidos.add(atributo);
  }

  // Adicionar Metodo na lista de atributos escolhidos na rodada do jogo
  addMetodoNaListaDaRodada(String metodo) {
    this.listaDeMetodosEscolhidos.add(metodo);
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

  removerMetodoNaListaDaRodada(String metodo) {
    if (metodo != null) {
      if (this.listaDeMetodosEscolhidos.length > 0) {
        this.listaDeMetodosEscolhidos.removeWhere((item) => item == metodo);
        return true;
      } else {
        return false;
      }
    }
  }

  retornaClasseDaRodada() {
    //Iniciar toda as listas para necessárias para a classe escolhida
    this.listaDeMetodosEscolhidos.clear();
    this.listaDeAtributosEscolhidos.clear();
    this.listaDeButoesAtributosColuna1.clear();
    this.listaDeButoesAtributosColuna2.clear();
    this.listaDeButoesMetodosColuna1.clear();
    this.listaDeButoesMetodosColuna2.clear();
    this.listaDeAtributosVerdadeiros.clear();
    this.listaDeMetodosVerdadeiros.clear();
    //////////////////////////////////////////////////////////////////////
    if (this.listaNomesDeClasses.length > 0) {
      //Pegando o enum nome da classe
      this.listaNomesDeClasses.shuffle();
      int randomNumber = random.nextInt(listaNomesDeClasses.length);
      debugPrint(
          "Tamnaho  da lista antes de remover 1: ${listaNomesDeClasses.length.toString()}");

      EnumsNomesDeClasses enumNomeDaClasse = listaNomesDeClasses[randomNumber];
      this.listaNomesDeClasses.remove(enumNomeDaClasse);
      debugPrint(
          "Tamnaho da lista depois de remover 2: ${listaNomesDeClasses.length.toString()}");

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
    } else {
      return null;
    }
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

//Usuario acertou todos os atributos e metdos
  limparListaDeAtributosMetodos() {
    this.listaDeAtributosEscolhidos.clear();
    this.listaDeMetodosEscolhidos.clear();
    this.listaDeAtributosVerdadeiros.clear();
    this.listaDeMetodosVerdadeiros.clear();

    debugPrint("Lista limpadas: ${this.listaDeAtributosEscolhidos.length}");
  }
}
