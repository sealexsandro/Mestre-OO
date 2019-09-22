import 'package:flutter/material.dart';
import 'package:jogo_mobile/baralhoDeCartasAnimal.dart';

import 'moldarCarta.dart';

typedef Null CardAcceptCallback(List<CartaDoBaralhoAnimal> card, int fromIndex);

//Esta é uma pilha de cartões sobrepostos (implementados usando uma pilha)
class LinhaDeCartas extends StatefulWidget {
  // Lista de carta na pilha
  final List<CartaDoBaralhoAnimal> cartas;

  // Callback when card is added to the stack
  //Retorno de chamada quando o cartão é adicionado à pilha
  final CardAcceptCallback onCardsAdded;

  // O índice da lista no jogo
  final int linhaIndex;

  LinhaDeCartas(
      {@required this.cartas,
      @required this.onCardsAdded,
      @required this.linhaIndex});

  @override
  _LinhaDeCartasState createState() => _LinhaDeCartasState();
}

class _LinhaDeCartasState extends State<LinhaDeCartas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  alignment: Alignment.topCenter,
      height: 85,
      width: 40,
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DragTarget<Map>(
        builder: (context, listOne, listTwo) {
          return Stack(
            children: widget.cartas.map((card) {
              int index = widget.cartas.indexOf(card);
              return MontarCartasDeAnimais(
                baralhoAnimal: card,
                cardsAnexados:
                    widget.cartas.sublist(index, widget.cartas.length),
                columnIndex: widget.linhaIndex,
              );
            }).toList(),
          );
        },
        onWillAccept: (value) {
          // If empty, accept
          if (widget.cartas.length == 0) {
            return true;
          }

          // Get dragged cards list
          List<CartaDoBaralhoAnimal> draggedCards = value["cards"];
          CartaDoBaralhoAnimal firstCard = draggedCards.first;
          // if (firstCard.cardColor == CardColor.red) {
          //   if (widget.cards.last.cardColor == CardColor.red) {
          //     return false;
          //   }

          //   int lastColumnCardIndex =
          //       CardType.values.indexOf(widget.cards.last.cardType);
          //   int firstDraggedCardIndex =
          //       CardType.values.indexOf(firstCard.cardType);

          //   if (lastColumnCardIndex != firstDraggedCardIndex + 1) {
          //     return false;
          //   }
          // } else {
          //   if (widget.cards.last.cardColor == CardColor.black) {
          //     return false;
          //   }

          //   int lastColumnCardIndex =
          //       CardType.values.indexOf(widget.cards.last.cardType);
          //   int firstDraggedCardIndex =
          //       CardType.values.indexOf(firstCard.cardType);

          //   if (lastColumnCardIndex != firstDraggedCardIndex + 1) {
          //     return false;
          //   }
          // }
          // return true;
        },
        onAccept: (value) {
          widget.onCardsAdded(
            value["cards"],
            value["fromIndex"],
          );
        },
      ),
    );
  }
}
