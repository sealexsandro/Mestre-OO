import 'package:jogo_mobile/src/business/nivel01Business.dart';
import 'package:jogo_mobile/src/dao/FirebaseServices.dart';
import 'package:jogo_mobile/src/dao/UsuarioDao.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';

class Fachada {
  Nivel01Business nivel01Business;
  final service = FirebaseService();
  UsuarioDao usuarioDao;

  // Construtor não poderá ser instanciado fora da classe
  Fachada._() {
    this.usuarioDao = new UsuarioDao();
  }
  static Fachada unicaInstanciaFachada;
  static Fachada getUnicaInstanciaFachada() {
    if (unicaInstanciaFachada == null) unicaInstanciaFachada = new Fachada._();
    return unicaInstanciaFachada;
  }

  loginComGoogle() {
    final response = service.loginGoogle();
    return response;
  }

  atualizarUser(
      int tipoAtualizacao,
      String emailAntigo,
      String emailNovo,
      String nomeAntigo,
      String nomeNovo,
      String senhaAntiga,
      String senhaNova) {
    if (tipoAtualizacao == 1) {
      final response = this.service.changeEmail(
          emailAntigo, emailNovo, nomeAntigo, nomeNovo, senhaAntiga, senhaNova);
      return response;
    } else {}
  }

  atualizarSenhaUser(String email, String senhaAntiga, String senhaNova) {
    final response = this.service.changePassword(email, senhaAntiga, senhaNova);
    return response;
  }

  // loginUser(login, senha) {
  //   final response = FirebaseService().login(login, senha);
  //   return response;
  // }

  loginUser(login, senha) {
    final response = FirebaseService().login(login, senha);
    return response;
  }

  salvarUsuario(nome, email, senha) {
    final response = service.cadastrarUser(nome, email, senha);
    return response;
  }

  getUsuario() {
    return UsuarioDao.get();
  }

  limparPrefers() {
    UsuarioDao.clear();
    service.logout();
  }

  startServicesNivel01(TipoDeProblema tipoDeProblema) {
    this.nivel01Business = Nivel01Business();
    return this.nivel01Business.startServices(tipoDeProblema);
  }

  // Retorna uma classe por partida
  ClasseTemplate retornaClasseDaRodada() {
    return this.nivel01Business.retornaClasseDaRodada();
  }

  List<String> listaConteudoDosBotoes(enumListasAuxiliares enumListaAuxiliar) {
    return this.nivel01Business.listaConteudoDosBotoes(enumListaAuxiliar);
  }

  // retorna true ou false
  bool addAtributoNaListaDaRodada(String atributo) {
    return this.nivel01Business.addAtributoNaListaDaRodada(atributo);
  }

  // retorna true ou false
  bool addMetodoEscolhidoPorJogador(String metodo) {
    return this.addMetodoEscolhidoPorJogador(metodo);
  }

  // Retorna a lista de atributos ou metodos escolhidos pelo jogador
  listaAtributosOuMetodosEscolhidos(String tipoDeLista) {
    return this.nivel01Business.listaAtributosOuMetodosEscolhidos(tipoDeLista);
  }

  removerAtributoOuMetodoEscolhido(String tipoDeItem, String item) {
    return this
        .nivel01Business
        .removerAtributoOuMetodoEscolhido(tipoDeItem, item);
  }

  // incrementar pontos da fase 1
  incrementarPontosDaRodada(String tipoDeIncrementacao) {
    return this.nivel01Business.incrementarPontosDaRodada(tipoDeIncrementacao);
  }

  // decrementar pontos da fase 1
  decrementarPontosDaRodada(String tipoDeDecrementacao) {
    return this.nivel01Business.decrementarPontosDaRodada(tipoDeDecrementacao);
  }

  validarClasse() {
    return this.nivel01Business.validarClasse();
  }
}
