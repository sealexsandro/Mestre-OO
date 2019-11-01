import 'package:flutter/material.dart';

alertClasseIncorreta(
    BuildContext context, String mensagem, String tituloDaMensagem) {
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
            // Center(
            //   child: Text(
            //     "Mestre OO",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
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
                    tituloDaMensagem,
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

alertClasseCorreta(
  BuildContext context,
  String mensagem,
  String tituloDaMensagem,
  String pontuacao,
  Function funcao,
) {
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
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.mood,
                    color: Colors.green,
                    size: 30,
                  ),
                  Text(
                    tituloDaMensagem,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent[400],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.justify,
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 19,
                    color: Colors.black87,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: mensagem),
                    new TextSpan(
                      text: pontuacao,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                    new TextSpan(
                      text: "  pontos.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                ),
                child: Text(
                  "Continuar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                funcao();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}
