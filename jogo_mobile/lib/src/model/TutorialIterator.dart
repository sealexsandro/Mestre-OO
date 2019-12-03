import 'package:jogo_mobile/src/model/IteratorAbstract.dart';
import 'package:jogo_mobile/src/model/ListaEncadeada.dart';
import 'package:jogo_mobile/src/model/Tutorial.dart';

class IteratorTutorial implements IteratorAbstract {
  ListaEncadeada lista;
  IteratorTutorial(ListaEncadeada lista) {
    this.lista = lista;
  }

  @override
  bool isProximo() {
    if (this.lista.posicaoAtual == null) {
      return this.lista.listaTutorial != null;
    } else {
      return this.lista.posicaoAtual.proximo != null;
    }
  }

  Tutorial getProximoAvancando() {
    if (this.lista.posicaoAtual == null) {
      this.lista.posicaoAtual = this.lista.listaTutorial;
      return this.lista.posicaoAtual;
    } else {
      Tutorial proximo = this.lista.posicaoAtual;
      this.lista.posicaoAtual = this.lista.posicaoAtual.proximo;
      return proximo;
    }
  }
}
