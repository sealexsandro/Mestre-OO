import 'package:flutter/material.dart';

class AlertaVerificaoConteudoDaClasse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      child: _showDialog(context),
    );
  }

  _showDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Flight Booked Successfully"),
      content: Text("Have a pleasant flight"),
    );

    // showDialog(
    //     context: context, builder: (BuildContext context) => alertDialog);
  }
}
