import 'package:flutter/material.dart';
import 'baralhoDeCartasAnimal.dart';
import 'containerCartaAnimal.dart';
import 'moldarCarta.dart';

class TelaArvoreAnimal extends StatefulWidget {
  @override
  _TelaArvoreAnimal createState() => _TelaArvoreAnimal();
}

class _TelaArvoreAnimal extends State<TelaArvoreAnimal> {
  // Containers das cartas de baralho
  CartaDoBaralhoAnimal linha1Container1;
  CartaDoBaralhoAnimal linha2Container1;
  CartaDoBaralhoAnimal linha2Container2;
  CartaDoBaralhoAnimal linha3Container1;
  CartaDoBaralhoAnimal linha3Container2;
  CartaDoBaralhoAnimal linha3Container3;
  CartaDoBaralhoAnimal linha3Container4;

  List<CartaDoBaralhoAnimal> cartasEscondidas = [];
  List<CartaDoBaralhoAnimal> cartasAbertas = [];

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "OO Jogo de Cartas",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.green,
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 40,
              ),
            ),
            splashColor: Colors.white,
            onTap: () {
              _startGame();
            },
          )
        ],
      ),
      body: Material(
        child: SafeArea(
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return ListView(
              children: <Widget>[
                SizedBox(
                  height: 14.0,
                ),
                Text(
                  "Monte a árvore de herança com o baralho de cartas disposto usando os conceitos de Orientação a Objetos",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ContainerDeCartaAnimal(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ContainerDeCartaAnimal(),
                    ContainerDeCartaAnimal(),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ContainerDeCartaAnimal(),
                    ContainerDeCartaAnimal(),
                    ContainerDeCartaAnimal(),
                    ContainerDeCartaAnimal(),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _baralhoDeEscolha(), //Conjunto de cartas para escolher
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  // Container cartasDaLinha(
  //     List<CartaDoBaralhoAnimal> cartasDaLinha, int posicaoDaLinha) {
  //   return Container(
  //     height: 80,
  //     width: 60,
  //     child: LinhaDeCartas(
  //       cartas: cartasDaLinha,
  //       onCardsAdded: (cartas, index) {
  //         setState(() {
  //           cartasDaLinha.addAll(cartas);
  //         });
  //       },tt
  //       linhaIndex: posicaoDaLinha,
  //     ),
  //   );
  // }

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
                    ),
                  )
                : Opacity(
                    opacity: 0.4,
                    //Quando não houver mais cartas para puxar
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: MontarCartasDeAnimais(
                        baralhoAnimal: CartaDoBaralhoAnimal(
                            classeMae: EnumsCartaBaseSuper.ave,
                            especieAnimal:
                                NomeDaEspecieCartasAnimal.getEspecieClasseAve(
                                    EnumsCartasAve.bem_te_vi),
                            pathDeImagemCorrespondente:
                                EnderecoDeImagemDaEspecie.getEnderecoImagemAve(
                                    EnumsCartasAve.bem_te_vi)),
                      ),
                    ),
                  ),
            onTap: () {
              setState(() {
                if (cartasEscondidas.isEmpty) {
                  print("Card Fechado!!");
                  cartasEscondidas.addAll(cartasAbertas.map((card) {
                    return card
                      ..cardFoiAberto = false
                      ..cardFaceVisivel = false;
                  }));
                  cartasAbertas.clear();
                } else {
                  print("Card Aberto!!");
                  cartasAbertas.add(
                    cartasEscondidas.removeLast()
                      ..cardFaceVisivel = true
                      ..cardFoiAberto = true,
                  );
                }
              });
            },
          ),
          cartasAbertas.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MontarCartasDeAnimais(
                    baralhoAnimal: cartasAbertas.last,
                    // cardsAnexados: [
                    //   cartasAbertas.last,
                    // ],
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

  // Novo jogo
  void _startGame() {
    this.cartasEscondidas = [];
    cartasAbertas = [];

    List<CartaDoBaralhoAnimal> allCards = [];

    EnumsCartaBaseSuper.values.forEach((cartaClasseMae) {
      // Cria todas as instancias da classe mamífero
      if (cartaClasseMae == EnumsCartaBaseSuper.mamifero) {
        // for para percorrer todas as cartas  mamifero
        EnumsCartasMamifero.values.forEach((cartaDeUmMamifero) {
          allCards.add(CartaDoBaralhoAnimal(
            classeMae: cartaClasseMae,
            especieAnimal: NomeDaEspecieCartasAnimal.getEspecieClasseMamifero(
                cartaDeUmMamifero),
            pathDeImagemCorrespondente:
                EnderecoDeImagemDaEspecie.getEnderecoImagemMamifero(
                    cartaDeUmMamifero),
            cardFaceVisivel: false,
          ));
        });
      }

      // Cria todas as instancias da classe Ave
      if (cartaClasseMae == EnumsCartaBaseSuper.ave) {
        // for para percorrer todas as cartas  ave
        EnumsCartasAve.values.forEach((cartaDeUmaAve) {
          allCards.add(CartaDoBaralhoAnimal(
            classeMae: cartaClasseMae,
            especieAnimal:
                NomeDaEspecieCartasAnimal.getEspecieClasseAve(cartaDeUmaAve),
            pathDeImagemCorrespondente:
                EnderecoDeImagemDaEspecie.getEnderecoImagemAve(cartaDeUmaAve),
            cardFaceVisivel: false,
          ));
        });
      }

      if (cartaClasseMae == EnumsCartaBaseSuper.reptil) {
        // for para percorrer todas as cartas  Reptil
        EnumsCartasRepteis.values.forEach((cartaDeUmReptil) {
          allCards.add(CartaDoBaralhoAnimal(
            classeMae: cartaClasseMae,
            especieAnimal: NomeDaEspecieCartasAnimal.getEspecieClasseReptil(
                cartaDeUmReptil),
            pathDeImagemCorrespondente:
                EnderecoDeImagemDaEspecie.getEnderecoImagemReptil(
                    cartaDeUmReptil),
            cardFaceVisivel: false,
          ));
        });
      }

      if (cartaClasseMae == EnumsCartaBaseSuper.aracnideo) {
        // for para percorrer todas as cartas  ave
        EnumsCartasAracnideo.values.forEach((cartaDeUmAracnideo) {
          allCards.add(CartaDoBaralhoAnimal(
            classeMae: cartaClasseMae,
            especieAnimal: NomeDaEspecieCartasAnimal.getEspecieClasseAracnideo(
                cartaDeUmAracnideo),
            pathDeImagemCorrespondente:
                EnderecoDeImagemDaEspecie.getEnderecoImagemAracnideo(
                    cartaDeUmAracnideo),
            cardFaceVisivel: false,
          ));
        });
      }
    });

    allCards.shuffle();
    this.cartasEscondidas = allCards;
    cartasAbertas.add(
      cartasEscondidas.removeLast()
        ..cardFoiAberto = true
        ..cardFaceVisivel = true,
    );

    setState(() {});
  }
}
