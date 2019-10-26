import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/enums_da_fase1.dart';
import 'package:provider/provider.dart';

class CaixaDialog extends StatefulWidget {
  ClasseGenerica classeGenerica;
  String tituloDoContainer;
  String textoQntDePontos;
  EnumsFase1CaixaDeDialog enumsFase1CaixaDeDialog;

  ControleNivel01 controleNivel01;
  CaixaDialog(
      {@required this.classeGenerica,
      @required this.tituloDoContainer,
      @required this.textoQntDePontos,
      @required this.enumsFase1CaixaDeDialog,
      @required this.controleNivel01});

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<CaixaDialog> {
  ClasseGenerica classeGenerica;
  String tituloDoContainer;
  String textoQntDePontos;
  EnumsFase1CaixaDeDialog enumsFase1CaixaDeDialog;
  Color corDoContainer = Colors.blueAccent[400];

  List<String> listaDeButoesColuna1 = []; // Atributos  ou metodos da coluna 1
  List<String> listaDeButoesColuna2 = []; // Atributos  ou metodos da coluna 2
  HashMap<String, Color> mapIsActiveDeButao;

  ControleNivel01 controleNivel01;

  @override
  void initState() {
    super.initState();
    this.classeGenerica = widget.classeGenerica;
    this.tituloDoContainer = widget.tituloDoContainer;
    this.textoQntDePontos = widget.textoQntDePontos;
    this.enumsFase1CaixaDeDialog = widget.enumsFase1CaixaDeDialog;
    this.controleNivel01 = widget.controleNivel01;
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
                inserirButoes(context), //Inserindo butoes na  caixa de dialogo
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
                      //  enviarAtributos(context);
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
    //  debugPrint("Tamanho da lista: " + listaDeButoesColuna1.length.toString());
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
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.all(1),
      child: FlatButton(
        color: isButaoJaEscolhido(nomeDoButao) == false
            ? corDoContainer
            : Colors.grey,
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
          enviarButaoEscolhido(nomeDoButao, corDoContainer) == true
              ? mudarCorDoButaoDesativacao(nomeDoButao)
              : mudarCorDoButaoDesativacao(nomeDoButao);
        },
      ),
    );
  }

  enviarButaoEscolhido(String conteudoDoButao, Color corDoButao) {
    if (this.enumsFase1CaixaDeDialog ==
        EnumsFase1CaixaDeDialog.caixaAtributos) {
      return enviarAtributos(conteudoDoButao);
    } else {
      return enviarMetodo(conteudoDoButao);
    }
  }

  enviarAtributos(String atributo) {
    ControleNivel01 c = Provider.of<ControleNivel01>(context);
    return c.addAtributoEscolhido(atributo);
  }

  enviarMetodo(String stringNomeMetodo) {
    ControleNivel01 c = Provider.of<ControleNivel01>(context);

    return c.addMetodoEscolhidoPorJogador(stringNomeMetodo);
  }

  _iniciarListas() {
    this.mapIsActiveDeButao = new HashMap();

    if (this.enumsFase1CaixaDeDialog ==
        EnumsFase1CaixaDeDialog.caixaAtributos) {
      this.listaDeButoesColuna1 = this.controleNivel01.listaAtributosColuna01();
      this.listaDeButoesColuna2 = this.controleNivel01.listaAtributosColuna02();
      debugPrint("Tamanho da lista: ${this.listaDeButoesColuna1.length}");
    } else {
      this.listaDeButoesColuna1 = this.controleNivel01.listaMetodosColuna01();
      this.listaDeButoesColuna2 = this.controleNivel01.listaMetodosColuna02();
    }
  }

  mudarCorDoButaoDesativacao(String nomeDoButao) {
    // var corDesativacao = Colors.grey;
    setState(() {
      // this
      //     .mapIsActiveDeButao
      //     .update(nomeDoButao, (valorAntigo) => corDesativacao);
    });
  }

  isButaoJaEscolhido(String nomeDoButao) {
    if (this.enumsFase1CaixaDeDialog ==
        EnumsFase1CaixaDeDialog.caixaAtributos) {
      return this.controleNivel01.getIsAtributoJaEscolhido(nomeDoButao);
    } else {
      return this.controleNivel01.getIsMetodoJaEscolhido(nomeDoButao);
    }
  }
}
