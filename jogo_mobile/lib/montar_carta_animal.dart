import 'package:flutter/material.dart';
import 'package:jogo_mobile/baralhos_do_jogo.dart';
import 'package:jogo_mobile/linha_cartas.dart';

class MontarCartasDeAnimais extends StatefulWidget {
  final BaralhoAnimal baralhoAnimal;
  final double distanciaEntreCards;
  final int transformIndex;
  final int columnIndex;
  final List<BaralhoAnimal> cardsAnexados;

  const MontarCartasDeAnimais(
      {this.baralhoAnimal,
      this.distanciaEntreCards = 15.0,
      this.transformIndex =0,
      this.columnIndex,
      this.cardsAnexados});

  @override
  _State createState() => _State();
}

class _State extends State<MontarCartasDeAnimais> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          0.0,
          widget.transformIndex * widget.distanciaEntreCards,
          0.0,
        ),
        child: _buildCard(),
    );
  }

  // Analisar melhor essa Parte
  Widget _buildCard() {
    return !widget.baralhoAnimal.faceUp
        ? Container(
            height: 60.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
          )
        : Draggable<Map>(
            child: _buildFaceUpCard(),
            feedback: LinhaDeCartas(
              cards: widget.cardsAnexados,
                linhaIndex: 1,
              onCardsAdded: (card, position) {},
            ),
            childWhenDragging: _buildFaceUpCard(),
            data: {
              "cards": widget.cardsAnexados,
              "fromIndex": widget.columnIndex,
            },
          );
  }

  Widget _buildFaceUpCard() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        height: 60.0,
        width: 40,
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      nomeDeCarta(),
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
               //     child: imagensDeCartas(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      nomeDeCarta(),
                      style: TextStyle(
                        fontSize: 5.0,
                      ),
                    ),
                    Container(
                      height: 10.0,
                  //    child: imagensDeCartas(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String nomeDeCarta() {
    switch (widget.baralhoAnimal.cartasBaralhoAnimal) {
      case EnumsBaralhoAnimal.bem_te_vi:
        return "Bem-te-Vi";
      case EnumsBaralhoAnimal.cachorro:
        return "Papagaio";
      case EnumsBaralhoAnimal.gato:
        return "Gato";
      case EnumsBaralhoAnimal.papagaio:
        return "Papagaio";
      default:
        return "";
    }
  }

  Image imagensDeCartas() {
    switch (widget.baralhoAnimal.cartasBaralhoAnimal) {
      case EnumsBaralhoAnimal.bem_te_vi:
        return Image.asset('images/.png');
      case EnumsBaralhoAnimal.cachorro:
        return Image.asset('images/.png');
      case EnumsBaralhoAnimal.gato:
        return Image.asset('images/.png');
      case EnumsBaralhoAnimal.papagaio:
        return Image.asset('images/.png');
      default:
        return null;
    }
  }
}
