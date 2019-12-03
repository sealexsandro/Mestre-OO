import 'package:auto_size_text/auto_size_text.dart';
import 'package:jogo_mobile/src/pages/ajuda/textoTutorial.dart';

class ControleTutorial {
  TextosTutorial textosTutorial;
  List<AutoSizeText> listaTotorial;

  ControleTutorial() {
    this.textosTutorial = new TextosTutorial();
  }

  guardarTextos() {
    String texto1 =
        "Uma locadora de veículo é um tipo de empreendimento que aluga "
        "vário(s) tipos de veículos para seus clientes por um "
        "determinado valor. "
        "Tendo isso em mente, monte as classes a seguir:";

    String texto2 =
        "Uma locadora de veículo é um tipo de empreendimento que aluga "
        "vário(s) tipos de veículos para seus clientes por um "
        "determinado valor. "
        "Tendo isso em mente, monte as classes a seguir:";

    String texto3 =
        "Uma locadora de veículo é um tipo de empreendimento que aluga "
        "vário(s) tipos de veículos para seus clientes por um "
        "determinado valor. "
        "Tendo isso em mente, monte as classes a seguir:";
    listaTotorial.add(textosTutorial.texto1);
    listaTotorial.add(textosTutorial.texto2);
    listaTotorial.add(textosTutorial.texto3);
  }
}
