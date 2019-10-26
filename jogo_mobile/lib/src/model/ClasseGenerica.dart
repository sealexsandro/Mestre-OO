import 'package:flutter/foundation.dart';

enum EnumsNomesDeClasses {
  Cachorro,
  carro,
  pessoa,
}

class NomesGenericosParaClasses {
  static String getNomesGenericoDeClasse(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      case EnumsNomesDeClasses.Cachorro:
        return "Cachorro";
      case EnumsNomesDeClasses.carro:
        return "Carro";
      case EnumsNomesDeClasses.pessoa:
        return "Pessoa";
      default:
        return "Não encontrou Nenhuma Espécie de Mamifero";
    }
  }

  static String getNomesDoSistema(EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      case EnumsNomesDeClasses.Cachorro:
        return "Sistema Para um Pet Shop";
      case EnumsNomesDeClasses.carro:
        return "Sistema Para Uma Concessionária";
      case EnumsNomesDeClasses.pessoa:
        return "Sistema Para Uma Clínica";
      default:
        return "Não encontrou Nenhuma Espécie de Mamifero";
    }
  }
}

class ClasseGenerica {
  EnumsNomesDeClasses enumNomeDaClasse;
  String nomeDaClasse;
  String nomeDoProblema;
  List<String> listaDeAtributosVerdadeiros;
  List<String> listaDeAtributosVariados;

  List<String> listaDeMetodosVerdadeiros;
  List<String> listaDeMetodosVariados;

  ClasseGenerica({
    @required this.enumNomeDaClasse,
    @required this.nomeDaClasse,
    @required this.nomeDoProblema,
    @required this.listaDeAtributosVerdadeiros,
    @required this.listaDeAtributosVariados,
    @required this.listaDeMetodosVerdadeiros,
    @required this.listaDeMetodosVariados,
  });
}