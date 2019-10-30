import 'package:jogo_mobile/src/model/ClasseGenerica.dart';

class MetodosDeClasseCorretos {
  static List<String> listaMetodosTrueCachorro = [
    "late(): void",
    "getPeso(): float",
    "corre(): String",
    "setPeso(peso: float): float",
    "cachorro(): void",
  ];
  static List<String> listaMetodosTrueAves = [
    "voar(): void",
    "getEspecie(): String",
    "setEspecie(): void",
    "ave(): Ave",
  ];

  static List<String> listaMetodosTruePessoa = [
    "setNome(): void",
    "setCpf(): float",
    "getNome: String",
    "andar(): void",
  ];

  static List<String> listaMetodosTrueCarro = [
    "setCarro(): String",
    "getCarro(): int",
  ];

  static List<String> getMetodosCorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      case EnumsNomesDeClasses.Cachorro:
        return listaMetodosTrueCachorro;
      case EnumsNomesDeClasses.carro:
        return listaMetodosTrueCarro;
      case EnumsNomesDeClasses.pessoa:
        return listaMetodosTruePessoa;
      case EnumsNomesDeClasses.aves:
        return listaMetodosTrueAves;
      default:
        List<String> lista = [];
        return lista;
    }
  }
}

class MetodosDeClasseIncorretos {
  static List<String> listaMetodosFalseCao = [
    "111111111111",
    "222222222222",
    "33333333333333",
    "44444444444444",
  ];
  static List<String> listaMetodosFalseAves = [
    "111111111111",
    "222222222222",
    "33333333333333",
    "44444444444444",
  ];
  static List<String> listaMetodosFalsePessoa = [
    "111111111111",
    "222222222222",
    "33333333333333",
    "44444444444444",
  ];
  static List<String> listaMetodosFalseCarro = [
    "111111111111",
    "222222222222",
    "33333333333333",
    "44444444444444",
  ];
  static List<String> getMetodosIncorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      case EnumsNomesDeClasses.Cachorro:
        return listaMetodosFalseCao;
      case EnumsNomesDeClasses.carro:
        return listaMetodosFalseCarro;
      case EnumsNomesDeClasses.pessoa:
        return listaMetodosFalsePessoa;
      case EnumsNomesDeClasses.aves:
        return listaMetodosFalseAves;
      default:
        return null;
    }
  }
}

class AtributoClass {
  int id;
  String atributoDeClasse;

  AtributoClass({this.id, this.atributoDeClasse});
}
