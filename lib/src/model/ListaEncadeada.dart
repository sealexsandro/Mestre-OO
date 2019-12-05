import 'package:jogo_mobile/src/model/IteratorAbstract.dart';
import 'package:jogo_mobile/src/model/ListaIteratorAsbtract.dart';
import 'package:jogo_mobile/src/model/Tutorial.dart';
import 'package:jogo_mobile/src/model/TutorialIterator.dart';

class ListaEncadeada implements ListaIteratorAbstract {
  Tutorial listaTutorial;

  ListaEncadeada(){
    this.listaTutorial = null;
  }

  inserirElemento(Tutorial tutorial) {
    if (this.listaTutorial == null) {
      this.listaTutorial = tutorial;
    } else {
      tutorial.proximo = this.listaTutorial;
      this.listaTutorial.proximo = tutorial;
    }
  }

  int getTamanhoLista() {
    // 1 - Verifica se a lista é vazia (lista==null)
    if (this.listaTutorial == null) {
      return 0;
    } else {
      int k = 0;
      Tutorial i;
      for (i = listaTutorial; i.proximo != null; i = i.proximo) k++;
      return k;
    }
  }

  static ListaEncadeada Copia(ListaEncadeada lista) {
    ListaEncadeada listaCopia = new ListaEncadeada();
    // 1 - Verifica se a lista é vazia (lista==null)
    if (lista == null) {
      // 1.1 - Vazia, retorna uma lista vazia
      return listaCopia;
    } else {
      //1.2 - Não vazia, varre a lista copiando elemento a elemento
      Tutorial i = lista.listaTutorial;
      while (i != null) {
        listaCopia.inserirElemento(
            new Tutorial(textoDeAresentacao: i.textoDeAresentacao));
        i = i.proximo;
      }
      return listaCopia;
    }
  }

  Tutorial posicaoAtual;
  @override
  IteratorAbstract createIterator() {
    new IteratorTutorial(this);
  }
}
