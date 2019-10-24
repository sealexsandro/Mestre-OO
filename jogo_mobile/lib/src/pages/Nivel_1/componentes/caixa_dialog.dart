import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/enums_da_fase1.dart';
import 'package:provider/provider.dart';

class CaixaDialog extends StatelessWidget {
  ClasseGenerica classeGenerica;
  String tituloDoContainer;
  String textoQntDePontos;
  EnumsFase1CaixaDeDialog enumsFase1CaixaDeDialog;
  Color corDoContainer = Colors.blueAccent[400];

  List<String> listaDeButoesColuna1 = []; // Atributos  ou metodos da coluna 1
  List<String> listaDeButoesColuna2 = []; // Atributos  ou metodos da coluna 2
  List<String> listaDeButoesMisturados = []; // Atributos ou metodos misturados

  ControleNivel01 controleNivel01;

  CaixaDialog(
      {@required this.classeGenerica,
      @required this.tituloDoContainer,
      @required this.textoQntDePontos,
      @required this.enumsFase1CaixaDeDialog}) {
    _iniciarListas(this.enumsFase1CaixaDeDialog);
  }

  @override
  Widget build(BuildContext context) {
    this.controleNivel01 = Provider.of<ControleNivel01>(context, listen: false);
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
                    tituloDoContainer.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    textoQntDePontos,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                inserirButoes(context),  //Inserindo butoes na  caixa de dialogo
                SizedBox(
                  height: 10,
                ),
                Center(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      enviarAtributos(context);
                    },
                  ),
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

  inserirButoes(BuildContext context) {
    debugPrint("Tamanho da lista: " + listaDeButoesColuna1.length.toString());
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
            children: listaDeButoesColuna1.map<Widget>((atributoClass) {
              return _butao(atributoClass, context);
            }).toList(),
          ),
          Column(
            children: listaDeButoesColuna2.map<Widget>((atributoClass) {
              return _butao(atributoClass, context);
            }).toList(),
          ),
        ],
      ),
    );
  }

 
  _butao(String nomeDoButao, BuildContext context) {
    debugPrint("Inserindo butoes!!");
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

  void _iniciarListas(EnumsFase1CaixaDeDialog enumsFase1CaixaDeDialog) {
    if (enumsFase1CaixaDeDialog == EnumsFase1CaixaDeDialog.caixaAtributos) {
      this.listaDeButoesMisturados =
          this.classeGenerica.listaDeAtributosVariados;
    } else {
      this.listaDeButoesMisturados = this.classeGenerica.listaDeMetodosVariados;
    }
    this.listaDeButoesMisturados.shuffle();
    if (this.listaDeButoesMisturados.length > 0) {
      for (var i = 0; i < this.listaDeButoesMisturados.length; i++) {
        if (i < 4) {
          //Preenchendo com atributos ou métodos
          this.listaDeButoesColuna1.add(this.listaDeButoesMisturados[i]);
        } else {
          //Preenchendo com atributos ou metodos
          this.listaDeButoesColuna2.add(this.listaDeButoesMisturados[i]);
        }
      }
    } else {
      debugPrint("Valores não Inseridos");
    }
  }

  _mudarCorDoButao(String atributo) {
    //update with a new color when the user taps button
    // setState(() {
    //   corDoContainer = Colors.pink;
    // });
    // ControllerFase1 tranferirAtrib =
    //     Provider.of<ControllerFase1>(context, listen: false);

    // tranferirAtrib.tranferirAtributo(nomeDoButaoAtributo);

    if (atributo != null) {
      var existe;
      for (var i = 0; i < this.listaDeButoesMisturados.length; i++) {
        if (atributo == this.listaDeButoesMisturados[i]) {
          existe = true;
        }
      }
      if (existe != true) {
        this.listaDeButoesMisturados.add(atributo);
      }
    }
  }

  enviarAtributos(BuildContext context) {
    if (this.listaDeButoesMisturados.length > 0) {
      ControleNivel01 tranferirAtrib =
          Provider.of<ControleNivel01>(context, listen: false);

      tranferirAtrib.tranferirAtributos(this.listaDeButoesMisturados);
    }
  }

  // enviarMetodos() {
  //   if (this.listaDeButoesMisturados.length > 0) {
  //     ControleNivel01 tranferirAtrib = controleNivel01
  //         .tranferirAtributos(this.listaDeButoesMisturados);
  //   }
  // }
}
