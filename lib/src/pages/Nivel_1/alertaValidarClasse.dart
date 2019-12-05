import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

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

msgAvisoAcertouTudo(BuildContext context, String icone, String tituloDaMensagem,
    String mensagem, Function funcao) {
  var showmodalBottomSheet = showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: NomeIcone.escolhaDeIcone(icone),
                // trailing: Icon(Icons.delete, color: Colors.red, size: 30),
                title: Text(
                  tituloDaMensagem,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: new Text(
                        mensagem,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5, bottom: 30),
                      width: MediaQuery.of(context).size.width / 1.9,
                      height: 60,
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Continuar",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        elevation: 6,
                        onPressed: () {
                          Navigator.pop(context);
                          funcao();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
  return showmodalBottomSheet;
}

msgAvisoQntMinimaAtribMet(BuildContext context, String icone,
    String tituloDaMensagem, String mensagem) {
  var showmodalBottomSheet = showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: NomeIcone.escolhaDeIcone(icone),
                // trailing: Icon(Icons.delete, color: Colors.red, size: 30),
                title: Text(
                  tituloDaMensagem,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: new Text(
                        mensagem,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5, bottom: 30),
                      width: MediaQuery.of(context).size.width / 1.9,
                      height: 60,
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        elevation: 6,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
  return showmodalBottomSheet;
}
