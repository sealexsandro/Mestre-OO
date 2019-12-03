import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/deliverItems.dart';

class MetodosDeClasse implements DeliverItems {
  @override
  getItensCorretos(EnumsNomesDeClasses enumsNomesDeClasses) {
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

  @override
  getItensInCorretos(EnumsNomesDeClasses enumsNomesDeClasses) {
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

  List<String> listaMetodosTruePessoa = [
    "setNome(): void",
    "setCpf(): float",
    "getNome: String",
    "andar(): void",
  ];

  /////// Sistema clinica Medica ////////////
  List<String> listaTrueMetodosPaciente = [
    "getNome: void",
    "getEndereco: Endereco",
    "gettipoSangineo: String",
    "getdoadorDeOrgaos: boolean",
  ];

  List<String> listaTrueMetodosMedico = [
    "getNome: String",
    "getRegistroMedico: String",
    "getEspecializacao: String",
    "getSalario: float"
  ];

  List<String> listaTrueMetodosAtendente = [
    "getNome: String",
    "getEndereco: Endereco",
    "getFormacaoTecnica: String",
    "getSalario: float"
  ];

  List<String> listaTrueMetodosEnfermeiros = [
    "getNome: String",
    "getCoren: String",
    "getEndereco: Endereco",
    "getSalario: float"
  ];

  /////// Sistema Pet Shop ////////////

  List<String> listaTrueMetodosCachorro = [
    "late(): void",
    "getPeso(): float",
    "corre(): String",
    "setPeso(peso: float): float",
    "cachorro(): void",
  ];

  List<String> listaTrueMetodosGato = [
    "racaDoGato: String",
    "peso: float",
    "corDoPelo: String",
    "vacinado: boolean",
  ];

  List<String> listaTrueMetodosAve = [
    "voar(): void",
    "getEspecie(): String",
    "setEspecie(): void",
    "ave(): Ave",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  List<String> listaTrueMetodosClienteLocadora = [
    "getNome: String",
    "getSexo: String",
    "getCpf: String",
    "getEndereco: Endereco",
  ];

  List<String> listaTrueMetodosContratoAluguel = [
    "getIdContrato: int",
    "getNomeDoCliente: String",
    "getDataDoContrato: Date",
    "getEmpresaLocadora: EmpresaLocadora",
  ];

  List<String> listaTrueMetodosVeiculoAlugado = [
    "getIdVeiculo: int",
    "getFabricante: String",
    "getModelo: String",
    "getTipoDeCombustivel: String",
    "getCorDoVeiculo: String",
  ];

/////////////////////////////// Incorretos //////////////////////////////////
  List<String> listaMetodosFalsePessoa = [
    "set()Nome: void",
    "set()Cpf(): float",
    "get()Nome: String",
    "andar()Set(): void",
  ];

  /////// Sistema clinica Medica ////////////
  List<String> listaFalseMetodosPaciente = [
    "get()Nome: void",
    "get()Endereco: Endereco",
    "get)()(tipoSangineo: String",
    "get()doadorDeOrgaos: boolean",
  ];

  List<String> listaFalseMetodosMedico = [
    "getNome(()): String",
    "get()RegistroMedico: String",
    "get()Especializacao: String",
    "get()Salario: float"
  ];

  List<String> listaFalseMetodosAtendente = [
    "get()Nome: String",
    "get()Endereco: Endereco",
    "get()FormacaoTecnica: String",
    "get()Salario: float"
  ];

  List<String> listaFalseMetodosEnfermeiros = [
    "get()Nome: String",
    "get()Coren: String",
    "get()Endereco: Endereco",
    "get()Salario: float"
  ];

  /////// Sistema Pet Shop ////////////

  List<String> listaFalseMetodosCachorro = [
    "late() void",
    "getPeso(): ",
    "corre()(): String",
    "setPeso(peso: ): float",
  ];

  List<String> listaFalseMetodosGato = [
    "raca Do Gato: String",
    "get-peso: float",
    "get-corDoPelo: String",
    "set-vacinado: boolean",
  ];

  List<String> listaFalseMetodosAve = [
    "voar()(): void",
    "get/Especie(): String",
    "set()Especie(): void",
    "ave(): ",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  List<String> listaFalseMetodosClienteLocadora = [
    "get()Nome: String",
    "get()Sexo: String",
    "get()Cpf: String",
    "get()Endereco: Endereco",
  ];

  List<String> listaFalseMetodosContratoAluguel = [
    "getIdContrato: ",
    "getNomeDoCliente: Stri",
    "getDataDoContrato Date",
    "getEmpresaLocadora - EmpresaLocadora",
  ];

  List<String> listaFalseMetodosVeiculoAlugado = [
    "get()IdVeiculo: int",
    "get()Fabricante: String",
    "getMode()lo: String",
    "get()TipoDeCombustivel: String",
    "get()CorDoVeiculo: String",
  ];
}
