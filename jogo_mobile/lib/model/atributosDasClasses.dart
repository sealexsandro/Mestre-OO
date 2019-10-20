import 'package:jogo_mobile/model/ClasseGenerica.dart';

enum EnumsClasseCachorro {
  racaCachorro,
  corDoPelo,
  altura,
}

class AtributosDeClasseCorretos {
  static String atributoVerdadeiro = "verdadeiro";
  static String atributoFalso = "falso";
  static List<String> listaTrueAtributosCachorro = [
    "racaDoCachorro: String",
    "altura: float",
    "CorDoPelo: String"
  ];

   static List<String> listaTrueAtributosPessoa = [
    "nome: String",
    "altura: float",
    "cpf: String"
  ];

   static List<String> listaTrueAtributosCarro = [
    "modelo: String",
    "qtdDeRodas: int",
    "qtdDePortas: int"
  ];

  static List<String> getAtributosCorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      case EnumsNomesDeClasses.Cachorro:
        return listaTrueAtributosCachorro;
      case EnumsNomesDeClasses.carro:
        return listaTrueAtributosCarro;
      case EnumsNomesDeClasses.pessoa:
        return listaTrueAtributosPessoa;
      default:
        List<String> lista = [];
        return lista;
    }
  }
}

class AtributosDeClasseIncorretos {
  static List<String> listaFalseAtributosCachorro = [
    "racaDo: Pink",
    ": float",
    "CorDoPelo:"
  ];
  static List<String> listaFalseAtributosPessoa = [
    "AnaLuiza",
    ": String",
    "Cor olho:"
  ];
 static List<String> listaFalseAtributosCarro = [
    "Parachoque",
    "String: String",
    "booleano:"
  ];
  static List<String> getAtributosIncorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      case EnumsNomesDeClasses.Cachorro:
        return listaFalseAtributosCachorro;
      case EnumsNomesDeClasses.carro:
        return listaFalseAtributosCarro;
      case EnumsNomesDeClasses.pessoa:
        return listaFalseAtributosPessoa;
      default:
        return null;
    }
  }
}

class AtributoClass{
  int id;
  String atributoDeClasse;

  AtributoClass({this.id, this.atributoDeClasse});
}