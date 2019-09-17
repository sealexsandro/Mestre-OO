import 'package:flutter/material.dart';

// altamente genericos
enum CartaBaseAnimal {
  animal,
  ave,
  mamifero,
  reptil,
}
// Mais especificos
enum EnumsBaralhoAnimal {
  bem_te_vi,
  papagaio,
  gato,
  cachorro,
}

enum CardObjetoVeiculo {
  // altamente genericos
  veiculo,
  veiculo_aquatico,

  // Mais especificos
  carro,
  canoa,
  caminhao,
  hiate,
}

class BaralhoAnimal {
  EnumsBaralhoAnimal cartasBaralhoAnimal;
  CartaBaseAnimal cartaBaseAnimal;
  bool faceUp;
  bool opened;

  BaralhoAnimal(
      {@required cartasBaralhoAnimal,
      @required cartaBaseAnimal,
      this.faceUp = false,
      this.opened = false});
}

class CartasDoBaralhoVeiculo {
  CardObjetoVeiculo cardObjetoVeiculo;
  bool faceUp;
  bool opened;

  CartasDoBaralhoVeiculo({this.cardObjetoVeiculo, this.faceUp, this.opened});
}
