import 'package:jogo_mobile/src/business/nivel01Business.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';

class Fachada {
  Nivel01Business nivel01Business;

  Fachada() {
    this.nivel01Business = Nivel01Business();
  }

  startServicesNivel01(
      TipoDeProblema tipoDeProblema) {
    return this.nivel01Business.startServices(tipoDeProblema);
  }

  // Retorna uma classe por partida
  ClasseTemplate retornaClasseDaRodada() {
    return this.nivel01Business.retornaClasseDaRodada();
  }

  List<String> listaConteudoDosBotoes(String listaRequerida) {
    return this.nivel01Business.listaConteudoDosBotoes(listaRequerida);
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
