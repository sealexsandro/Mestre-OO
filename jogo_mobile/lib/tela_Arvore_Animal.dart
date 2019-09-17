import 'package:flutter/material.dart';
import 'package:jogo_mobile/baralhos_do_jogo.dart';

import 'dart:math';

import 'package:jogo_mobile/montar_carta_animal.dart';

class TelaArvoreAnimal extends StatefulWidget {
  @override
  _TelaArvoreAnimal createState() => _TelaArvoreAnimal();
}

class _TelaArvoreAnimal extends State<TelaArvoreAnimal> {
  List<BaralhoAnimal> cartasEscondidas = [];
  List<BaralhoAnimal> cartasAbertas = [];

  List<BaralhoAnimal> cartasMamifero = [];
  List<BaralhoAnimal> cartasAve = [];
  List<BaralhoAnimal> cartasReptil = [];
  List<BaralhoAnimal> cartasAracnideo = [];

 @override
  void initState() {
    super.initState();
    _initialiseGame();
  }
 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Rumo aos Objetos"),
          elevation: 0.0,
          backgroundColor: Colors.green,
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
              splashColor: Colors.white,
              onTap: () {
                _initialiseGame();
              },
            )
          ],
        ),
        body:  Row(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _baralhoDeEscolha(), //Conjunto de cartar para escolher
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[],
            ),
          ],
        ),
      );
    }

    Widget _baralhoDeEscolha() {
      return Container(
        child: Row(
          children: <Widget>[
            InkWell(
              child: cartasEscondidas.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MontarCartasDeAnimais(
                        baralhoAnimal: cartasEscondidas.last,
                      ))
                  : Opacity(
                      opacity: 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MontarCartasDeAnimais(
                          baralhoAnimal: BaralhoAnimal(
                            cartaBaseAnimal: CartaBaseAnimal.ave,
                            cartasBaralhoAnimal: EnumsBaralhoAnimal.bem_te_vi,
                          ),
                        ),
                      ),
                    ),
              onTap: () {
                setState(() {
                  if (cartasEscondidas.isEmpty) {
                    cartasEscondidas.addAll(cartasAbertas.map((card) {
                      return card
                        ..opened = false
                        ..faceUp = false;
                    }));
                    cartasAbertas.clear();
                  } else {
                    cartasAbertas.add(
                      cartasEscondidas.removeLast()
                        ..faceUp = true
                        ..opened = true,
                    );
                  }
                });
              },
            ),
            cartasEscondidas.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: MontarCartasDeAnimais(
                      baralhoAnimal: cartasAbertas.last,
                      cardsAnexados: [
                        cartasAbertas.last,
                      ],
                      columnIndex: 0,
                    ),
                  )
                : Container(
                    width: 40.0,
                  ),
          ],
        ),
      );
    }

  // Initialise a new game
  void _initialiseGame() {
    cartasEscondidas = [];
    cartasAbertas = [];

    // Stores the card in the upper boxes
    cartasMamifero = [];
    cartasAve = [];
    cartasReptil = [];
    cartasAracnideo = [];

    List<BaralhoAnimal> allCards = [];

    // Add all cards to deck
    // Adicionando todos os cards(ou objetos PlayingCard) em uma lista,
    CartaBaseAnimal.values.forEach((cartaBase) {
      EnumsBaralhoAnimal.values.forEach((carta) {
        allCards.add(BaralhoAnimal(
          cartasBaralhoAnimal: carta,
          cartaBaseAnimal: cartaBase,
          faceUp: false,
        ));
      });
    });

    Random random = Random();

    // Add cards to columns and remaining to deck
    // for (int i = 0; i < 28; i++) {
    //   // numero randomico que corresponderá a um indice da lista de todas as cartas
    //   int randomNumber = random.nextInt(allCards.length);

     
    // }

     cartasEscondidas = allCards;
      cartasAbertas.add(
        cartasEscondidas.removeLast()
          ..opened = true
          ..faceUp = true,
      );

      setState(() {});
  }
}
