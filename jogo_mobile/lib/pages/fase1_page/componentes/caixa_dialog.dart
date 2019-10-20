import 'package:flutter/material.dart';
import 'package:jogo_mobile/model/ClasseGenerica.dart';
import 'package:jogo_mobile/model/atributosDasClasses.dart';
import 'package:jogo_mobile/pages/fase1_page/atributosBloc.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  ClasseGenerica classeGenerica;
  Color corDoContainer = Colors.blueAccent[400];

  List<String> listDeAtributosColuna1 = [];
  List<String> listDeAtributosColuna2 = [];
  List<String> listDeAtributosMisturados = [];

  TransferirdadosDaClasseBloc bloc;

  CustomDialog(ClasseGenerica classeGenerica) {
    this.classeGenerica = classeGenerica;
    _iniciarListas();
  }

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
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Escolha Atributos".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Pontos por Atributo correto: 05 pontos",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                inseriAtributos(context),
                SizedBox(
                  height: 10,
                ),
                Center(
                  // margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10)),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Finalizar Escolha",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        // fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      enviarAtributos(context);
                    },
                  ),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: <Widget>[
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   child: RaisedButton(
                  //     color: Colors.deepOrange,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: new BorderRadius.circular(10)),
                  //     padding: EdgeInsets.only(left: 0),
                  //     child: Text(
                  //       "Cancelar".toUpperCase(),
                  //       style: TextStyle(
                  //         fontSize: 15,
                  //         color: Colors.white,
                  //         // fontFamily: 'Raleway',
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  //     Container(
                  //       // padding: EdgeInsets.only(right: 20),
                  //       margin: EdgeInsets.only(left: 30),
                  //       child: RaisedButton(
                  //         color: Colors.deepOrange,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: new BorderRadius.circular(10)),
                  //         padding: EdgeInsets.only(left: 0),
                  //         child: Text(
                  //           "Ok".toUpperCase(),
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             color: Colors.white,
                  //             // fontFamily: 'Raleway',
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //           enviarAtributos(context);
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
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

  inseriAtributos(BuildContext context) {
    debugPrint("Tamanho da lista: " + listDeAtributosColuna1.length.toString());
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      margin: EdgeInsets.only(left: 10, top: 5),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: listDeAtributosColuna1.map<Widget>((atributoClass) {
              return _butao(atributoClass, context);
            }).toList(),
          ),
          Column(
            children: listDeAtributosColuna2.map<Widget>((atributoClass) {
              return _butao(atributoClass, context);
            }).toList(),
          ),
        ],
      ),
    );
  }

  _butao(String nomeDoButao, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.all(1),
      child: FlatButton(
        color: corDoContainer,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
        padding: EdgeInsets.only(left: 0),
        child: Text(
          nomeDoButao,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
            // fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          _mudarCorDoButao(nomeDoButao);
        },
      ),
    );
  }

  void _iniciarListas() {
    listDeAtributosColuna1 = [];
    listDeAtributosColuna2 = [];
    List<String> listDeAtributosVariados =
        this.classeGenerica.listaDeAtributosVariados;

    if (listDeAtributosVariados.length > 0) {
      // listDeAtributosVariados.shuffle();
      for (var i = 0; i < listDeAtributosVariados.length; i++) {
        if (i < 4) {
          //      debugPrint("Valor do atributo: " + listDeAtributosVariados[i]);
          //Preenchendo com atributos Corretos da classe escolhida
          listDeAtributosColuna1.add(listDeAtributosVariados[i]);
        } else {
          //Preenchendo com atributos Incorretos para classe escolhida
          listDeAtributosColuna2.add(listDeAtributosVariados[i]);
        }
      }
    } else {
      debugPrint("Valore Nulos");
    }
  }

  _mudarCorDoButao(String atributo) {
    //update with a new color when the user taps button
    // setState(() {
    //   corDoContainer = Colors.pink;
    // });
    // TransferirdadosDaClasseBloc tranferirAtrib =
    //     Provider.of<TransferirdadosDaClasseBloc>(context, listen: false);

    // tranferirAtrib.tranferirAtributo(nomeDoButaoAtributo);

    if (AtributoClass() != null) {
      var existe;
      for (var i = 0; i < this.listDeAtributosMisturados.length; i++) {
        if (atributo == this.listDeAtributosMisturados[i]) {
          existe = true;
        }
      }
      if (existe != true) {
        debugPrint("Inseriu-------------------");
        this.listDeAtributosMisturados.add(atributo);
      }
    }
  }

  enviarAtributos(BuildContext context) {
    if (this.listDeAtributosMisturados.length > 0) {
      TransferirdadosDaClasseBloc tranferirAtrib =
          Provider.of<TransferirdadosDaClasseBloc>(context, listen: false);

      tranferirAtrib.tranferirAtributos(this.listDeAtributosMisturados);
    }
  }
}
