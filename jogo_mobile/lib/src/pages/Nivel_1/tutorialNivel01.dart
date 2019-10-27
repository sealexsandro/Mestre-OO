import 'package:flutter/material.dart';

class TutorialNivel01 extends StatefulWidget {
  @override
  _TutorialNivel01State createState() => _TutorialNivel01State();
}

class _TutorialNivel01State extends State<TutorialNivel01> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.7,
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 18.0,
            ),
            margin: EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Objetivo deste nível".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                textoInformativo(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 40),
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10)),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Finalizar Tutorial",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/Nivel01");
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10)),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Próximo",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/Nivel01");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  textoInformativo() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      margin: EdgeInsets.only(left: 10, top: 5),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 8.0, right: 8),
        child: Text(
          "Objetos possuem características pelas quais os identificamos e finalidades"
          "para as quais os utilizamos. Essas características são tipicamente chamadas"
          "de atributos, no linguajar da programação OO."
          "  Portanto preciso que você crie objetos com base nas classes já criadas.",
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
