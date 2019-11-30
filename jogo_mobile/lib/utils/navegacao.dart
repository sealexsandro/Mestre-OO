import 'package:flutter/material.dart';

Future nextScreen(BuildContext context, Widget page) {
  //Aqui a tela que chama esse metodo é retirada da pilha de telas
  print("Pedido de chamada de nova tela!");
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}
