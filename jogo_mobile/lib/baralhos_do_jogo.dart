import 'package:flutter/material.dart';

enum CardObjetoAnimal {
  // altamente genericos
  animal,
  ave,
  mamifero,

  // Mais especificos
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

class CartasDoBaralhoAnimal {
  CardObjetoAnimal cardObjetoAnimal;
  bool faceUp;
  bool opened;

  CartasDoBaralhoAnimal({this.cardObjetoAnimal, this.faceUp, this.opened});
}

class CartasDoBaralhoVeiculo {
  CardObjetoVeiculo cardObjetoVeiculo;
  bool faceUp;
  bool opened;

  CartasDoBaralhoVeiculo({this.cardObjetoVeiculo, this.faceUp, this.opened});
}
