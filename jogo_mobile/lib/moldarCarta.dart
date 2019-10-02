import 'package:flutter/material.dart';
import 'package:jogo_mobile/baralhoDeCartasAnimal.dart';

class MontarCartasDeAnimais extends StatefulWidget {
  final CartaDoBaralhoAnimal baralhoAnimal;
  final int columnIndex;
  final List<CartaDoBaralhoAnimal> cardsAnexados;

  const MontarCartasDeAnimais(
      {this.baralhoAnimal, this.columnIndex, this.cardsAnexados});

  @override
  _State createState() => _State();
}

class _State extends State<MontarCartasDeAnimais> {
  @override
  Widget build(BuildContext context) {
    return _buildBaralho();
  }

  Widget _buildBaralho() {
    return !widget.baralhoAnimal.cardFaceVisivel
        ? Container(
            height: 80,
            width: 60,
            alignment: Alignment.center,
            child: Text("Baralho Animal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                )),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
          )
        : Draggable<Map>(
            // elemento que é exibido enquanto nada acontece
            child: _buidCartaVisivel(),

            //widget a ser exibido no local original de Draggable quando o arrasto estiver em andamento.
            childWhenDragging: _buidCartaVisivel(),

            //widget que é exibido no arrasto.
            feedback: _buidCartaVisivel(),

            data: {
              "cards": widget.cardsAnexados,
              "fromIndex": widget.columnIndex,
            },
          );
  }

  Widget _buidCartaVisivel() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
        ),
        height: 80,
        width: 60,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.baralhoAnimal.especieAnimal,
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    child: getImagens(
                        widget.baralhoAnimal.pathDeImagemCorrespondente),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image getImagens(String enderecoDaImagem) {
    if (enderecoDaImagem != null) {
      return Image.asset(enderecoDaImagem);
    }
  }
}
