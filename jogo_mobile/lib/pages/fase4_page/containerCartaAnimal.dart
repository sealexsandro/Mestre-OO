import 'package:flutter/material.dart';

class ContainerDeCartaAnimal extends StatefulWidget {
  // O índice da lista no jogo

  ContainerDeCartaAnimal();

  @override
  _ContainerDeCartaAnimal createState() => _ContainerDeCartaAnimal();
}

class _ContainerDeCartaAnimal extends State<ContainerDeCartaAnimal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DragTarget<Map>(
        builder: (context, listOne, listTwo) {
          return Container(
            height: 70,
            width: 50,
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
          );
        },
        onWillAccept: (value) {
          return true;
        },
        onAccept: (value) {},
      ),
    );
  }
}
