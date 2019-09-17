import 'package:flutter/material.dart';
import 'package:jogo_mobile/baralhos_do_jogo.dart';
import 'package:jogo_mobile/montar_carta_animal.dart';


typedef Null CardAcceptCallback(List<BaralhoAnimal> card, int fromIndex);

//Esta é uma pilha de cartões sobrepostos (implementados usando uma pilha)
class LinhaDeCartas extends StatefulWidget {

  // Lista de carta na pilha
  final List<BaralhoAnimal> cards;

  // Callback when card is added to the stack
  //Retorno de chamada quando o cartão é adicionado à pilha
  final CardAcceptCallback onCardsAdded;

  // O índice da lista no jogo
  final int linhaIndex;

  LinhaDeCartas(
      {@required this.cards,
      @required this.onCardsAdded,
      @required this.linhaIndex});

  @override
  _LinhaDeCartasState createState() => _LinhaDeCartasState();
}

class _LinhaDeCartasState extends State<LinhaDeCartas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topCenter,
      height: 13.0 * 15.0,
      width: 70.0,
      margin: EdgeInsets.all(2.0),
      child: DragTarget<Map>(
        builder: (context, listOne, listTwo) {
          return Stack(
            children: widget.cards.map((card) {
              int index = widget.cards.indexOf(card);
              return MontarCartasDeAnimais(
                baralhoAnimal: card,
                transformIndex: index,
                cardsAnexados: widget.cards.sublist(index, widget.cards.length),
                columnIndex: widget.linhaIndex,
              );
            }).toList(),
          );
        },
        onWillAccept: (value) {
          // If empty, accept
          if (widget.cards.length == 0) {
            return true;
          }

          // Get dragged cards list
          List<BaralhoAnimal> draggedCards = value["cards"];
          BaralhoAnimal firstCard = draggedCards.first;
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
