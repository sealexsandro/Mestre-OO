
enum EnumsNomesDeClasses {
  /////Nomes Genericos que ////////////
  pessoa,
  /////Clinica Medica /////////
  paciente,
  medico,
  atendente,
  enfermeiro,
  /////Pet Shop///////////////
  Cachorro,
  aves,
  gato,
  /////Locadora de Carros///////////////
  carro,
  contratoAluguel,
}

enum TipoDeProblema {
  sistemaLocadoraDeCarro,
  sistemaPetShop,
  sitemaClinicaMedica,
}

class ItensDaClasseGenerica {
  Map<EnumsNomesDeClasses, String> lstNomeClassesClinicaMedica = {
    EnumsNomesDeClasses.paciente: "Paciente",
    EnumsNomesDeClasses.medico: "Medico",
    EnumsNomesDeClasses.atendente: "Atendente",
    EnumsNomesDeClasses.enfermeiro: "Enfermeiro",
  };

  Map<EnumsNomesDeClasses, String> lstNomeClassesPetShop = {
    EnumsNomesDeClasses.Cachorro: "Cachorro",
    EnumsNomesDeClasses.aves: "Aves",
    EnumsNomesDeClasses.gato: "Gato",
  };

  Map<EnumsNomesDeClasses, String> lstNomeClassesLocadoraVeiculos = {
    EnumsNomesDeClasses.pessoa: "Cliente",
    EnumsNomesDeClasses.carro: "Carro",
    EnumsNomesDeClasses.contratoAluguel: "ContratoAluguel",
  };

  getListaDeNomesDeClasses(TipoDeProblema tipoDeProblema) {
    switch (tipoDeProblema) {
      case TipoDeProblema.sitemaClinicaMedica:
        return lstNomeClassesClinicaMedica;

      case TipoDeProblema.sistemaPetShop:
        return lstNomeClassesPetShop;

      case TipoDeProblema.sistemaLocadoraDeCarro:
        return lstNomeClassesLocadoraVeiculos;
      default:
        return "Classes não Encontrada!";
    }
  }

  String getNomeDoSistema(TipoDeProblema tipoDeProblema) {
    switch (tipoDeProblema) {
      case TipoDeProblema.sistemaPetShop:
        return "Sistema Para um Pet Shop";
      case TipoDeProblema.sistemaLocadoraDeCarro:
        return "Sistema Para Locadora De Veículos";
      case TipoDeProblema.sitemaClinicaMedica:
        return "Sistema Para Uma Clínica";

      default:
        return "Não encontrou Nenhum Tipo de Classe Solicitada!";
    }
  }
}
