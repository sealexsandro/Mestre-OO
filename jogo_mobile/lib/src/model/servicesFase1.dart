import 'dart:math';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/model/atributosDasClasses.dart';
import 'package:jogo_mobile/src/model/metodosDasClasses.dart';

class ServiceNivel_1 {
  var mapDetextosProblema;
  List<EnumsNomesDeClasses> listaNomesDeClasses;
  Random random = Random();
  // Metodos que serão escolhidos pelo jogador
  List<String> listaDeMetodosEscolhidos;

  ServiceNivel_1() {
    iniciarLista();
  }

  iniciarLista() {
    listaNomesDeClasses = [];
    this.listaDeMetodosEscolhidos = [];
    EnumsNomesDeClasses.values.forEach((nomeDaClasse) {
      listaNomesDeClasses.add(nomeDaClasse);
    });
  }

  AddMetodoNaListaDaRodada(String metodo) {
    if (metodo != null) {
      if (this.listaDeMetodosEscolhidos.length > 0) {
        bool metodoRepetido = false;
        for (var i = 0; i < this.listaDeMetodosEscolhidos.length; i++) {
          if (this.listaDeMetodosEscolhidos[i] == metodo) {
            metodoRepetido = true;
          }
        }
        if (metodoRepetido == false) {
          this.listaDeMetodosEscolhidos.add(metodo);
        }
      }
    } else {
      //tratar essa excessão
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
    listaNomesDeClasses.shuffle();
    int randomNumber = random.nextInt(listaNomesDeClasses.length);
    EnumsNomesDeClasses enumNomeDaClasse = listaNomesDeClasses[randomNumber];
    listaNomesDeClasses.remove(randomNumber);
    //////////////////////////////////////

    var nomeDaClasse =
        NomesGenericosParaClasses.getNomesGenericoDeClasse(enumNomeDaClasse);
    var nomeDoSistema =
        NomesGenericosParaClasses.getNomesDoSistema(enumNomeDaClasse);
    ////////////////////////////////////////////////////////////////////////////
    //Buscando atributos verdadeiros e falsos
    List<String> listaDeAtributosVerdadeiros =
        AtributosDeClasseCorretos.getAtributosCorretos(enumNomeDaClasse);
    List<String> listaDeAtributosFalsos =
        AtributosDeClasseIncorretos.getAtributosIncorretos(enumNomeDaClasse);

    listaDeAtributosVerdadeiros.shuffle();
    listaDeAtributosFalsos.shuffle();
    List<String> listaDeAtributosMisturados =
        listaMisturada(listaDeAtributosVerdadeiros, listaDeAtributosFalsos);
    /////////////////////////////////////////////////////////////////////////////
    //Buscando métodos verdadeiros e falsos
    List<String> listaDeMetodosVerdadeiros =
        MetodosDeClasseCorretos.getMetodosCorretos(enumNomeDaClasse);
    List<String> listaDeMetodosFalsos =
        MetodosDeClasseIncorretos.getMetodosIncorretos(enumNomeDaClasse);
    listaDeMetodosVerdadeiros.shuffle();
    listaDeMetodosFalsos.shuffle();
    List<String> listaDeMetodosMisturados =
        listaMisturada(listaDeMetodosVerdadeiros, listaDeMetodosFalsos);
    //////////////////////////////////////////////////////////////////////////////
    ClasseGenerica classeGenerica = new ClasseGenerica(
      enumNomeDaClasse: enumNomeDaClasse,
      nomeDaClasse: nomeDaClasse,
      nomeDoProblema: nomeDoSistema,
      listaDeAtributosVerdadeiros: listaDeAtributosVerdadeiros,
      listaDeAtributosVariados: listaDeAtributosMisturados,
      listaDeMetodosVerdadeiros: listaDeMetodosVerdadeiros,
      listaDeMetodosVariados: listaDeMetodosMisturados,
    );

    return classeGenerica;
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
}
