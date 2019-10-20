import 'dart:math';
import 'package:jogo_mobile/model/ClasseGenerica.dart';
import 'package:jogo_mobile/model/atributosDasClasses.dart';

class ServiceFase1 {
  var mapDetextosProblema;
  List<EnumsNomesDeClasses> listaNomesDeClasses;
  Random random = Random();

  ServiceFase1() {
    iniciarLista();
  }

  iniciarLista() {
    listaNomesDeClasses = [];
    EnumsNomesDeClasses.values.forEach((nomeDaClasse) {
      listaNomesDeClasses.add(nomeDaClasse);
    });
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
    List<String> listaDeAtributosVerdadeiros =
        AtributosDeClasseCorretos.getAtributosCorretos(enumNomeDaClasse);
    List<String> listaDeAtributosFalsos =
        AtributosDeClasseIncorretos.getAtributosIncorretos(enumNomeDaClasse);

    listaDeAtributosVerdadeiros.shuffle();
    listaDeAtributosFalsos.shuffle();
    List<String> listaDeAtributosMisturados = [];

    int cont = 0;
    for (var i = 0; i < 8; i++) {
      if (i < 4 && listaDeAtributosVerdadeiros.length > i) {
        //Preenchendo com atributos Corretos da classe escolhida
        listaDeAtributosMisturados.add(listaDeAtributosVerdadeiros[i]);
      } else if (i >= 4 && listaDeAtributosFalsos.length > cont) {
        //Preenchendo com atributos Incorretos para classe escolhida
        listaDeAtributosMisturados.add(listaDeAtributosFalsos[cont]);
        cont++;
      }
    }

    ClasseGenerica classeGenerica = new ClasseGenerica(
      enumNomeDaClasse: enumNomeDaClasse,
      nomeDaClasse: nomeDaClasse,
      nomeDoProblema: nomeDoSistema,
      listaDeAtributosVerdadeiros: listaDeAtributosVerdadeiros,
      listaDeAtributosVariados: listaDeAtributosMisturados,
    );

    return classeGenerica;
  }

}
