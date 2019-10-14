enum EnumsClasseCachorro {
  racaCachorro,
  corDoPelo,
  altura,
}

class AtributosCorretosClasseCachorro {
  static List<String> listTrueAtributosCachorro = [
    "racaDoCachorro: String",
    "altura: float",
    "CorDoPelo: String",
    "idade: int",
    "vacinado: boolean",
  ];

  static List<String> listFalseAtributosCachorro = [
    "espessuraDaParede: float",
    "corDaTinta: float",
    "String"
  ];

  // static String getAtributosClasseCachorro(
  //     EnumsClasseCachorro enumsClasseCachorro) {
  //   switch (enumsClasseCachorro) {
  //     case EnumsClasseCachorro.racaCachorro:
  //       return "racaDoCachorro: String";
  //     case EnumsClasseCachorro.altura:
  //       return "altura: float";
  //     case EnumsClasseCachorro.corDoPelo:
  //       return "CorDoPelo: String";
  //     default:
  //       return "Não encontrou Nenhuma Espécie de Mamifero";
  //   }
  // }
}
