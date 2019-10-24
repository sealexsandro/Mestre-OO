import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String textoDoButao;
  Function onPressedFunction;
  double alturaDoButao;
  double comprimentoDoButao;
  Color corDoButao;
  var decoration;

  ButtonWidget(this.textoDoButao,
      {@required this.onPressedFunction,
      this.alturaDoButao,
      this.comprimentoDoButao,
      this.corDoButao,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: this.comprimentoDoButao,
      height: this.alturaDoButao,
      child: RaisedButton(
        color: this.corDoButao,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            this.textoDoButao.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              // fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 6,
        onPressed: onPressedFunction,
      ),
    );
  }
}
