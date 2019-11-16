
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';

class AtributosDeClasseCorretos {
  // Sistema Para Clinica
  static List<String> listaTrueAtributosPaciente = [
    "nome: String",
    "endereco: Endereco",
    "tipoSangineo: String",
    "doadorDeOrgaos: boolean",
  ];

  static List<String> listaTrueAtributosMedico = [
    "nome: String",
    "registroMedico: String",
    "especializacao: String",
    "salario: float"
  ];

  static List<String> listaTrueAtendente = [
    "nome: String",
    "endereco: Endereco",
    "formacaoTecnica: String",
    "salario: float"
  ];

  static List<String> listaTrueAtributosEnfermeiros = [
    "nome: String",
    "coren: String",
    "endereco: Endereco",
    "salario: float"
  ];

  //////////////////////////////////////////////////////

  // Sistema Para Pet Shop

  static List<String> listaTrueAtributosCachorro = [
    "racaDoCao: String",
    "altura: float",
    "corDoPelo: String",
    "vacinado: boolean",
  ];

  static List<String> listaTrueAtributosGato = [
    "racaDoGato: String",
    "peso: float",
    "corDoPelo: String",
    "vacinado: boolean",
  ];

  static List<String> listaTrueAtributosAve = [
    "especie: String",
    "ameacadoDeExtincao: boolean",
    "corDaPlumagem: String",
    "habitateNatural: String",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  static List<String> listaTrueAtributosClienteLocadora = [
    "nome: String",
    "sexo: String",
    "cpf: String",
    "endereco: Endereco",
  ];

  static List<String> listaTrueAtributosContratoAluguel = [
    "idContrato: int",
    "nomeDoCliente: String",
    "dataDoContrato: Date",
    "empresaLocadora: EmpresaLocadora",
  ];

  static List<String> listaTrueAtributosVeiculoAlugado = [
    "idVeiculo: int",
    "fabricante: String",
    "modelo: String",
    "tipoDeCombustivel: String",
    "corDoVeiculo: String",
  ];

  static List<String> getAtributosCorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      ////////////Clinica Medica////////////////////
      case EnumsNomesDeClasses.paciente:
        return listaTrueAtributosPaciente;
      case EnumsNomesDeClasses.medico:
        return listaTrueAtributosMedico;
      case EnumsNomesDeClasses.atendente:
        return listaTrueAtendente;
      case EnumsNomesDeClasses.enfermeiro:
        return listaTrueAtributosEnfermeiros;
      ////////////Pet Shop////////////////////
      case EnumsNomesDeClasses.Cachorro:
        return listaTrueAtributosCachorro;
      case EnumsNomesDeClasses.aves:
        return listaTrueAtributosAve;
      case EnumsNomesDeClasses.gato:
        return listaTrueAtributosGato;
      //
      ////////////Locadora de Carros////////////////////
      case EnumsNomesDeClasses.pessoa:
        return listaTrueAtributosClienteLocadora;
      case EnumsNomesDeClasses.carro:
        return listaTrueAtributosVeiculoAlugado;
      case EnumsNomesDeClasses.contratoAluguel:
        return listaTrueAtributosContratoAluguel;
      default:
        List<String> listaVazia = [];
        return listaVazia;
    }
  }
}

class AtributosDeClasseIncorretos {
  // Sistema Para Clinica
  static List<String> listaFalseAtributosPaciente = [
    "nome: char",
    "endereco: Rua/Bairro",
    "tipoSangineo: boolean",
    "doadorDeOrgaos: Não",
  ];

  static List<String> listaFalseAtributosMedico = [
    "nome: int",
    ": String",
    "especializacao: clinicoGeral",
    "salario: dolar"
  ];

  static List<String> listaFalseAtributosAtendente = [
    "nome: Patricia",
    "String: endereco",
    "formacaoTecnica: Enfermagem",
    "salario: Libra"
  ];

  static List<String> listaFalseAtributosEnfermeiros = [
    "nome -String",
    "coren: StringInt",
    "String: Endereco",
    "salario foat"
  ];

  //////////////////////////////////////////////////////
  ///// Sistema Para Pet Shop
  static List<String> listaFalseAtributosCachorro = [
    "racaDoCao: Pit Bull",
    ": float",
    "Rex: String",
    "idade: boolean",
  ];
  static List<String> listaFalseAtributosGato = [
    "racaDoGato String",
    "peso: boolean",
    "idade: 2 anos",
    "vacinado: sim",
  ];

  static List<String> listaFalseAtributosAve = [
    "especie: irracional",
    ": float",
    "CorDaPlumagem:",
    ": String",
    "tamanhoDaAsa: Grande",
  ];

//////////////////////////////////////////////////////////
  //Sistema para Locadora de Veículos

  static List<String> listaFalseAtributosClienteLocadora = [
    "nome - String",
    "sexo: M ou F",
    "String cpf: ",
    "Endereco Endereco",
  ];

  static List<String> listaFalseAtributosContratoAluguel = [
    "codigoContrato: int",
    "nomeDoCliente: String",
    "dataDoContrato: Date",
    "empresaLocadora: EmpresaLocadora",
  ];

  static List<String> listaFalseAtributosVeiculoAlugado = [
    "id  Veiculo: int",
    "String: pneu",
    "modelo Strin",
    "tipoDeCombustivel: ÓLEO",
    "corDoVeiculo: Hexadecimal",
  ];

  static List<String> getAtributosIncorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {

      ////////////Clinica Médica //////////////
      case EnumsNomesDeClasses.paciente:
        return listaFalseAtributosPaciente;
      case EnumsNomesDeClasses.medico:
        return listaFalseAtributosMedico;
      case EnumsNomesDeClasses.atendente:
        return listaFalseAtributosAtendente;
      case EnumsNomesDeClasses.enfermeiro:
        return listaFalseAtributosEnfermeiros;
      //
      ////////////Pet Shop////////////////////
      case EnumsNomesDeClasses.Cachorro:
        return listaFalseAtributosCachorro;
      case EnumsNomesDeClasses.aves:
        return listaFalseAtributosAve;
      case EnumsNomesDeClasses.gato:
        return listaFalseAtributosGato;
      //
      ////////////Locadora de Carros////////////////////
      case EnumsNomesDeClasses.pessoa:
        return listaFalseAtributosClienteLocadora;
      case EnumsNomesDeClasses.carro:
        return listaFalseAtributosVeiculoAlugado;
      case EnumsNomesDeClasses.contratoAluguel:
        return listaFalseAtributosContratoAluguel;
      default:
        List<String> listaVazia = [];
        return listaVazia;
    }
  }
}
