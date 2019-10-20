import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String textoDoButao;
  Function onPressedFunction;

  ButtonWidget(String textoDoButao, {@required this.onPressedFunction}) {
    this.textoDoButao = textoDoButao;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width / 2.5,
      height: 60,
      child: RaisedButton(
        color: Colors.deepOrange,
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
