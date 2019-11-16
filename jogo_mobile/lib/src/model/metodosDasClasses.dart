import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';

class MetodosDeClasseCorretos {
   static List<String> listaMetodosTruePessoa = [
    "setNome(): void",
    "setCpf(): float",
    "getNome: String",
    "andar(): void",
  ];

  /////// Sistema clinica Medica ////////////
  static List<String> listaTrueMetodosPaciente = [
    "getNome: void",
    "getEndereco: Endereco",
    "gettipoSangineo: String",
    "getdoadorDeOrgaos: boolean",
  ];

  static List<String> listaTrueMetodosMedico = [
    "getNome: String",
    "getRegistroMedico: String",
    "getEspecializacao: String",
    "getSalario: float"
  ];

  static List<String> listaTrueMetodosAtendente = [
    "getNome: String",
    "getEndereco: Endereco",
    "getFormacaoTecnica: String",
    "getSalario: float"
  ];

  static List<String> listaTrueMetodosEnfermeiros = [
    "getNome: String",
    "getCoren: String",
    "getEndereco: Endereco",
    "getSalario: float"
  ];

  /////// Sistema Pet Shop ////////////

   static List<String> listaTrueMetodosCachorro = [
    "late(): void",
    "getPeso(): float",
    "corre(): String",
    "setPeso(peso: float): float",
    "cachorro(): void",
  ];

  static List<String> listaTrueMetodosGato = [
    "racaDoGato: String",
    "peso: float",
    "corDoPelo: String",
    "vacinado: boolean",
  ];

  static List<String> listaTrueMetodosAve = [
    "voar(): void",
    "getEspecie(): String",
    "setEspecie(): void",
    "ave(): Ave",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  static List<String> listaTrueMetodosClienteLocadora = [
    "getNome: String",
    "getSexo: String",
    "getCpf: String",
    "getEndereco: Endereco",
  ];

  static List<String> listaTrueMetodosContratoAluguel = [
    "getIdContrato: int",
    "getNomeDoCliente: String",
    "getDataDoContrato: Date",
    "getEmpresaLocadora: EmpresaLocadora",
  ];

  static List<String> listaTrueMetodosVeiculoAlugado = [
    "getIdVeiculo: int",
    "getFabricante: String",
    "getModelo: String",
    "getTipoDeCombustivel: String",
    "getCorDoVeiculo: String",
  ];

  static List<String> getMetodosCorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
      ////////////Clinica Medica////////////////////
      case EnumsNomesDeClasses.paciente:
        return listaTrueMetodosPaciente;
      case EnumsNomesDeClasses.medico:
        return listaTrueMetodosMedico;
      case EnumsNomesDeClasses.atendente:
        return listaTrueMetodosAtendente;
      case EnumsNomesDeClasses.enfermeiro:
        return listaTrueMetodosEnfermeiros;
      ////////////Pet Shop////////////////////
      case EnumsNomesDeClasses.Cachorro:
        return listaTrueMetodosCachorro;
      case EnumsNomesDeClasses.aves:
        return listaTrueMetodosAve;
      case EnumsNomesDeClasses.gato:
        return listaTrueMetodosGato;
      //
      ////////////Locadora de Carros////////////////////
      case EnumsNomesDeClasses.pessoa:
        return listaTrueMetodosClienteLocadora;
      case EnumsNomesDeClasses.carro:
        return listaTrueMetodosVeiculoAlugado;
      case EnumsNomesDeClasses.contratoAluguel:
        return listaTrueMetodosContratoAluguel;
      default:
        List<String> listaVazia = [];
        return listaVazia;
    }
  }
}

class MetodosDeClasseIncorretos {
  static List<String> listaMetodosFalsePessoa = [
    "set()Nome: void",
    "set()Cpf(): float",
    "get()Nome: String",
    "andar()Set(): void",
  ];

  /////// Sistema clinica Medica ////////////
  static List<String> listaFalseMetodosPaciente = [
    "get()Nome: void",
    "get()Endereco: Endereco",
    "get)()(tipoSangineo: String",
    "get()doadorDeOrgaos: boolean",
  ];

  static List<String> listaFalseMetodosMedico = [
    "getNome(()): String",
    "get()RegistroMedico: String",
    "get()Especializacao: String",
    "get()Salario: float"
  ];

  static List<String> listaFalseMetodosAtendente = [
    "get()Nome: String",
    "get()Endereco: Endereco",
    "get()FormacaoTecnica: String",
    "get()Salario: float"
  ];

  static List<String> listaFalseMetodosEnfermeiros = [
    "get()Nome: String",
    "get()Coren: String",
    "get()Endereco: Endereco",
    "get()Salario: float"
  ];

  /////// Sistema Pet Shop ////////////

   static List<String> listaFalseMetodosCachorro = [
    "late() void",
    "getPeso(): ",
    "corre()(): String",
    "setPeso(peso: ): float",
  ];

  static List<String> listaFalseMetodosGato = [
    "raca Do Gato: String",
    "get-peso: float",
    "get-corDoPelo: String",
    "set-vacinado: boolean",
  ];

  static List<String> listaFalseMetodosAve = [
    "voar()(): void",
    "get/Especie(): String",
    "set()Especie(): void",
    "ave(): ",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  static List<String> listaFalseMetodosClienteLocadora = [
    "get()Nome: String",
    "get()Sexo: String",
    "get()Cpf: String",
    "get()Endereco: Endereco",
  ];

  static List<String> listaFalseMetodosContratoAluguel = [
    "getIdContrato: ",
    "getNomeDoCliente: Stri",
    "getDataDoContrato Date",
    "getEmpresaLocadora - EmpresaLocadora",
  ];

  static List<String> listaFalseMetodosVeiculoAlugado = [
    "get()IdVeiculo: int",
    "get()Fabricante: String",
    "getMode()lo: String",
    "get()TipoDeCombustivel: String",
    "get()CorDoVeiculo: String",
  ];
  static List<String> getMetodosIncorretos(
      EnumsNomesDeClasses enumsNomesDeClasses) {
    switch (enumsNomesDeClasses) {
         ////////////Clinica Medica////////////////////
      case EnumsNomesDeClasses.paciente:
        return listaFalseMetodosPaciente;
      case EnumsNomesDeClasses.medico:
        return listaFalseMetodosMedico;
      case EnumsNomesDeClasses.atendente:
        return listaFalseMetodosAtendente;
      case EnumsNomesDeClasses.enfermeiro:
        return listaFalseMetodosEnfermeiros;
      ////////////Pet Shop////////////////////
      case EnumsNomesDeClasses.Cachorro:
        return listaFalseMetodosCachorro;
      case EnumsNomesDeClasses.aves:
        return listaFalseMetodosAve;
      case EnumsNomesDeClasses.gato:
        return listaFalseMetodosGato;
      //
      ////////////Locadora de Carros////////////////////
      case EnumsNomesDeClasses.pessoa:
        return listaFalseMetodosClienteLocadora;
      case EnumsNomesDeClasses.carro:
        return listaFalseMetodosVeiculoAlugado;
      case EnumsNomesDeClasses.contratoAluguel:
        return listaFalseMetodosContratoAluguel;
      default:
        List<String> listaVazia = [];
        return listaVazia;
    }
  }
}
