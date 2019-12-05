import 'package:flutter/material.dart';

alertNotificacao(BuildContext context, String mensagem, {Function callback}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.black,
      child: Container(
        padding: EdgeInsets.only(
          top: 18.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.report,
                    color: Colors.red,
                    size: 30,
                  ),
                  Text(
                    "Opa...",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent[400],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: new Text(mensagem,
                    style: TextStyle(fontSize: 20, color: Colors.black54)),
              ),
            ),
            SizedBox(height: 24.0),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                ),
                child: Text(
                  "Fechar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}
