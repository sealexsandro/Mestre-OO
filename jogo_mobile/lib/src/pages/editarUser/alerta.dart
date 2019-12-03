import 'package:flutter/material.dart';

alertaAtualizacao(BuildContext context,{String tituloDaMensagem= "", String mensagem= ""}) {
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
                leading: Icon(Icons.feedback, color: Colors.blue, size: 30),
                // trailing: Icon(Icons.delete, color: Colors.red, size: 30),
                title: Text(
                  mensagem,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Center(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10),
                  //     child: new Text(
                  //       mensagem,
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         color: Colors.black54,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
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
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        );
      });
  return showmodalBottomSheet;
}
