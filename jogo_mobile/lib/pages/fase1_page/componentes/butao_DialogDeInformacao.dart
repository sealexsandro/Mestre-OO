import 'package:flutter/material.dart';
import 'package:jogo_mobile/pages/fase1_page/atributosBloc.dart';
import 'package:provider/provider.dart';

class ButaoCaixaDeDialogo extends StatefulWidget {
  String textoDoButao;
  ButaoCaixaDeDialogo(String textoDoButao) {
    this.textoDoButao = textoDoButao;
  }

  @override
  _ButaoCaixaDeDialogoState createState() =>
      _ButaoCaixaDeDialogoState(this.textoDoButao);
}

class _ButaoCaixaDeDialogoState extends State<ButaoCaixaDeDialogo> {
  String textoDoButao;
//  String nomeDoAtributo;
  Color corDoContainer = Colors.blueAccent[400];
  final List<String> listDeAtributos = ["1111", "222222", "33333333"];
  final List<String> listDeAtributosColuna1 = ["1111", "222222", "33333333"];
  final List<String> listDeAtributosColuna2 = [
    "44444444",
    "55555555",
    "666666",
    "7777777"
  ];

  _ButaoCaixaDeDialogoState(String textoDoButao) {
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
        onPressed: () => caixaDeDialog(),
      ),
    );
  }

  caixaDeDialog() {
    final screenSize = MediaQuery.of(context).size;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Center(
        child: Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          width: screenSize.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
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
              inseriAtributos(),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10)),
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Cancelar".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            // fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10)),
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Ok".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            // fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  inseriAtributos() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      margin: EdgeInsets.only(left: 10, top: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: listDeAtributosColuna1.map<Widget>((nomeDoButaoAtributo) {
              return _butao(nomeDoButaoAtributo);
            }).toList(),
          ),
          Column(
            children: listDeAtributosColuna2.map<Widget>((nomeDoButaoAtributo) {
              return _butao(nomeDoButaoAtributo);
            }).toList(),
          ),
        ],
      ),
    );
  }

  _butao(String nomeDoButaoAtributo) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.6,
      child: FlatButton(
        color: corDoContainer,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
        padding: EdgeInsets.only(left: 0),
        child: Text(
          nomeDoButaoAtributo.toUpperCase(),
          style: TextStyle(
            fontSize: 13,
            color: Colors.white,
            // fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          _mudarCorDoButao(nomeDoButaoAtributo);
        },
      ),
    );
  }

  _mudarCorDoButao(String nomeDoButaoAtributo) {
    //update with a new color when the user taps button
    // setState(() {
    //   corDoContainer = Colors.pink;
    // });
    TransferirdadosDaClasseBloc tranferirAtrib =
        Provider.of<TransferirdadosDaClasseBloc>(context, listen: false);

    tranferirAtrib.tranferirAtributo(nomeDoButaoAtributo);
  }
}
