import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/deliverItems.dart';

class AtributosDeClasse implements DeliverItems {
  @override
  getItensCorretos(EnumsNomesDeClasses enumsNomesDeClasses) {
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

  @override
  getItensInCorretos(EnumsNomesDeClasses enumsNomesDeClasses) {
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

  // Sistema Para Clinica
  List<String> listaTrueAtributosPaciente = [
    "- nome: String",
    "- endereco: Endereco",
    "- tipoSanguineo: String",
    "- doadorDeOrgaos: boolean",
  ];

  List<String> listaTrueAtributosMedico = [
    "- nome: String",
    "- registroMedico: String",
    "- especializacao: String",
    "- salario: float"
  ];

  List<String> listaTrueAtendente = [
    "- nome: String",
    "- endereco: Endereco",
    "- formacaoTecnica: String",
    "- salario: float"
  ];

  List<String> listaTrueAtributosEnfermeiros = [
    "- nome: String",
    "- coren: String",
    "- endereco: Endereco",
    "- salario: float"
  ];

  //////////////////////////////////////////////////////

  // Sistema Para Pet Shop

  List<String> listaTrueAtributosCachorro = [
    "- racaDoCao: String",
    "- altura: float",
    "- corDoPelo: String",
    "- vacinado: boolean",
    "- peso: float",
  ];

  List<String> listaTrueAtributosGato = [
    "- racaDoGato: String",
    "- peso: float",
    "- corDoPelo: String",
    "- vacinado: boolean",
  ];

  List<String> listaTrueAtributosAve = [
    "- especie: String",
    "- ameacaDeExtincao: boolean",
    "- corDasPenas: String",
    "- habitateNatural: String",
  ];

  ////////////////////////////////////////////////

  //Sistema para Locadora de Veículos

  List<String> listaTrueAtributosClienteLocadora = [
    "- nome: String",
    "- sexo: String",
    "- cpf: String",
    "- endereco: Endereco",
  ];

  List<String> listaTrueAtributosContratoAluguel = [
    "- idContrato: int",
    "- nomeDoCliente: String",
    "- dataDoContrato: Date",
    "- empresaLocadora: EmpresaLocadora",
  ];

  List<String> listaTrueAtributosVeiculoAlugado = [
    "- idVeiculo: int",
    "- fabricante: String",
    "- modelo: String",
    "- tipoDeCombustivel: String",
    "- corDoVeiculo: String",
  ];

  //////////////////// Incorretos ///////////////////////////////////////
  // Sistema Para Clinica
  List<String> listaFalseAtributosPaciente = [
    "nome",
    "- endereco :",
    "+= tipoSanguineo: String",
    "-= doaOrgaos: boolean",
  ];

  List<String> listaFalseAtributosMedico = [
    "*= nome: String",
    ": String",
    "+ especializacao:",
    "- salario:"
  ];

  List<String> listaFalseAtributosAtendente = [
    "+ : nome",
    "- String: ",
    ": formacaoTecnica:",
    "# salario  2000"
  ];

  List<String> listaFalseAtributosEnfermeiros = [
    "- nome * String",
    "@ coren: String",
    "! String: Endereco",
    "§ salario float"
  ];

  //////////////////////////////////////////////////////
  ///// Sistema Para Pet Shop
  List<String> listaFalseAtributosCachorro = [
    "racaDoCao:",
    ": float",
    "+: String",
    "vacinado",
  ];
  List<String> listaFalseAtributosGato = [
    "racaDoGato += String",
    "peso: quilo ou grama",
    "idade: 2 anos",
    "vacinado : ",
  ];

  List<String> listaFalseAtributosAve = [
    "especie +: String",
    "-: float",
    "- CorDaPlumagem:",
    "+: String",
    "- tamanhoDaAsa:",
  ];

//////////////////////////////////////////////////////////
  //Sistema para Locadora de Veículos

  List<String> listaFalseAtributosClienteLocadora = [
    "nome - String",
    "sexo: M ou F",
    "String cpf: ",
    "Endereco * End",
  ];

  List<String> listaFalseAtributosContratoAluguel = [
    "@ codigoContrato: int",
    "-nome = Cliente: String",
    "-data * Contrato: Date",
    "- empresaLocadora / empresa",
  ];

  List<String> listaFalseAtributosVeiculoAlugado = [
    "id  Veiculo: int",
    "String: pneu",
    "modelo Strin",
    "! tipoDeCombustivel: ÓLEO",
    "-corDoVeiculo ^: Cor ",
  ];
}
