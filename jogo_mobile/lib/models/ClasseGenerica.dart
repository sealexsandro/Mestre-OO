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
}

class ClasseGenerica {
  String nomeDaClasse;
  List<String> listaDeAtributos;
  List<String> listaDeMetodos;

  ClasseGenerica(String nomeDaClasse, List<String> listaDeAtributos, List<String> listaDeMetodos ){
    this.nomeDaClasse = nomeDaClasse;
    this.listaDeAtributos = listaDeAtributos;
    this.listaDeMetodos = listaDeMetodos;
  }
  
}
