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
    "+ setNome()",
    "+ setCpf()",
    "+ getNome()",
    "+ andar()",
  ];

  /////// Sistema clinica Medica ////////////
  List<String> listaTrueMetodosPaciente = [
    "+ getNome(): String",
    "+ getEndereco(): Endereco",
    "+ getTipoSangineo(): String",
    "+ getDoaOrgaos(): boolean",
  ];

  List<String> listaTrueMetodosMedico = [
    "+ getNome(): String",
    "+ getRegistroMedico():String",
    "+ getEspecializacao():String",
    "+ getSalario(): float"
  ];

  List<String> listaTrueMetodosAtendente = [
    "+ getNome(): String",
    "+ getEndereco(): Endereco",
    "+ getFormacaoTecnica(): String",
    "+ getSalario(): float"
  ];

  List<String> listaTrueMetodosEnfermeiros = [
    "+ getNome(): String",
    "+ getCoren(): String",
    "+ getEndereco(): Endereco",
    "+ getSalario(): float"
  ];

  /////// Sistema Pet Shop ////////////

  List<String> listaTrueMetodosCachorro = [
    "+ getRacaCao(): String",
    "+ getPeso(): float",
    "+ getCorPelo(): String",
    "+ getAltura(): float",
  ];

  List<String> listaTrueMetodosGato = [
    "+ getRacaDoGato(): String",
    "+ getPeso(): float",
    "+ getCorDoPelo(): String",
    "+ getVacinado(): boolean",
  ];

  List<String> listaTrueMetodosAve = [
    "+ getCorPenas(): String",
    "+ getEspecie(): String",
    "+ getEmExtincao(): boolean",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  List<String> listaTrueMetodosClienteLocadora = [
    "+ getNome(): String",
    "+ getSexo(): String",
    "+ getCpf(): String",
    "+ getEndereco(): Endereco",
  ];

  List<String> listaTrueMetodosContratoAluguel = [
    "+ getIdContrato(): int",
    "+ getNomeDoCliente(): String",
    "+ getDataDoContrato(): Date",
    "+ getEmpresaLocadora(): EmpresaLocadora",
  ];

  List<String> listaTrueMetodosVeiculoAlugado = [
    "+ getIdVeiculo(): int",
    "+ getFabricante(): String",
    "+ getModelo(): String",
    "+ getTipoDeCombustivel(): String",
    "+ getCorDoVeiculo(): String",
  ];

/////////////////////////////// Incorretos //////////////////////////////////
  List<String> listaMetodosFalsePessoa = [
    "getNome() null",
    "getCpf(): ",
    "getNome() String",
    "andarSet() void",
  ];

  /////// Sistema clinica Medica ////////////
  List<String> listaFalseMetodosPaciente = [
    "* getNome(): String",
    "+ get()Endereco",
    "+ get()(tipoSangineo)",
    "+ get()doaOrgaos",
  ];

  List<String> listaFalseMetodosMedico = [
    "+ getNome():: String",
    "= getRegistroMedico()",
    "getEspecializacao()",
    "+ get^Salario:"
  ];

  List<String> listaFalseMetodosAtendente = [
    "+ getNome{}: String",
    "+ getEndereco[]: Endereco",
    "- getFormacaoTecnica= tecnico",
    "+ getSalario float"
  ];

  List<String> listaFalseMetodosEnfermeiros = [
    "getNome",
    "getCoren",
    "getEndereco +Endereco",
    "get()Salario"
  ];

  /////// Sistema Pet Shop ////////////

  List<String> listaFalseMetodosCachorro = [
    "/ late{}",
    "getPeso(): ",
    "corre()",
    ", setPeso(peso): void",
  ];

  List<String> listaFalseMetodosGato = [
    "raca Do Gato",
    "get-peso())",
    "| getcorDoPelo()",
    "; setvacinado()",
  ];

  List<String> listaFalseMetodosAve = [
    "voar()(): void",
    "getEspecie",
    "set()Especie",
    "! ave() ",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  List<String> listaFalseMetodosClienteLocadora = [
    "getNome{}: String",
    "getSexo[]: String",
    "getCpf:",
    "getEndereco",
  ];

  List<String> listaFalseMetodosContratoAluguel = [
    "getIdContrato: ",
    "getNomeDoCliente: Stri",
    "getDataDoContrato !Date",
    "getEmpresaLocadora {}",
  ];

  List<String> listaFalseMetodosVeiculoAlugado = [
    ", getIdVeiculo()",
    "_? getFabricante()",
    "@ getModelo()",
    "getTipoDeCombustivel())",
    ": getCorDoVeiculo",
  ];
}
