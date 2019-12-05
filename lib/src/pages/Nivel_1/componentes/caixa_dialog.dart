import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/mixedLabels.dart';
import 'package:provider/provider.dart';

class CaixaDialog extends StatefulWidget {
  ClasseTemplate classeTemplate;
  EnumsCaixaDialogNivel01 enumsCaixaDialogNivel01;

  CaixaDialog(
      {@required this.classeTemplate, @required this.enumsCaixaDialogNivel01});

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<CaixaDialog> {
  ClasseTemplate classeTemplate;
  EnumsCaixaDialogNivel01 enumsCaixaDialogNivel01;
  Color corDoContainer = Colors.blueAccent[400];

  List<String> listaDeButoesColuna1 = []; // Atributos  ou metodos da coluna 1
  List<String> listaDeButoesColuna2 = []; // Atributos  ou metodos da coluna 2
  HashMap<String, Color> mapIsActiveDeButao;
  final String titulo = "titulo";
  final String textoQntDePontos = "textoQntDePontos";

  ControleNivel01 controleNivel01;

  @override
  void initState() {
    super.initState();
    this.classeTemplate = widget.classeTemplate;
    this.enumsCaixaDialogNivel01 = widget.enumsCaixaDialogNivel01;
    this.controleNivel01 = Provider.of<ControleNivel01>(context, listen: false);
    _iniciarListas();
  }

  @override
  Widget build(BuildContext context) {
    return dialogContent(context);
  }

  Widget dialogContent(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.15,
        height: MediaQuery.of(context).size.height / 1.6,
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
                      solicitarTexto(titulo),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    child: Text(
                      solicitarTexto(textoQntDePontos),
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Consumer<ControleNivel01>(
                    builder: (context, controleNivel01, widget) {
                      return inserirButoes(context);
                    },
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Center(
                    child: RaisedButton(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Finalizar Escolha",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
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
                    radius: 22,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  inserirButoes(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.23,
      // height: MediaQuery.of(context).size.height / 2.8,
      margin: EdgeInsets.only(
        left: 5,
        top: 5,
      ),
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
      width: MediaQuery.of(context).size.width / 2.67,
      margin: EdgeInsets.all(3),
      //   padding: EdgeInsets.all(2),
      child: FlatButton(
        color: isButaoJaEscolhido(nomeDoButao) == false
            ? corDoContainer
            : Colors.grey,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
        padding: EdgeInsets.all(4),
        child: Center(
          child: Text(
            nomeDoButao,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onPressed: () {
          enviarButaoEscolhido(nomeDoButao);
        },
      ),
    );
  }

  enviarButaoEscolhido(String conteudoDoButao) {
    if (this.enumsCaixaDialogNivel01 ==
        EnumsCaixaDialogNivel01.caixaAtributos) {
      enviarAtributos(conteudoDoButao);
    } else {
      enviarMetodo(conteudoDoButao);
    }
  }

  enviarAtributos(String atributo) {
    ControleNivel01 c = Provider.of<ControleNivel01>(context);
    c.addAtributoEscolhido(atributo);
  }

  enviarMetodo(String stringNomeMetodo) {
    ControleNivel01 c = Provider.of<ControleNivel01>(context);
    c.addMetodoEscolhidoPorJogador(stringNomeMetodo);
  }

  _iniciarListas() {
    this.mapIsActiveDeButao = new HashMap();

    if (this.enumsCaixaDialogNivel01 ==
        EnumsCaixaDialogNivel01.caixaAtributos) {
      this.listaDeButoesColuna1 = this
          .controleNivel01
          .listaConteudoDosBotoes(enumListasAuxiliares.listAtribColumn01);
      this.listaDeButoesColuna2 = this
          .controleNivel01
          .listaConteudoDosBotoes(enumListasAuxiliares.listAtribColumn02);
    } else {
      this.listaDeButoesColuna1 = this
          .controleNivel01
          .listaConteudoDosBotoes(enumListasAuxiliares.listMetodosColumn01);
      this.listaDeButoesColuna2 = this
          .controleNivel01
          .listaConteudoDosBotoes(enumListasAuxiliares.listMetodosColumn02);
    }
  }

  isButaoJaEscolhido(String nomeDoButao) {
    if (this.enumsCaixaDialogNivel01 ==
        EnumsCaixaDialogNivel01.caixaAtributos) {
      return this
          .controleNivel01
          .listaDeAtributosEscolhidos
          .contains(nomeDoButao);
    } else {
      return this
          .controleNivel01
          .listaDeMetodosEscolhidos
          .contains(nomeDoButao);
    }
  }

  solicitarTexto(String tipoDeTexto) {
    if (tipoDeTexto == titulo) {
      if (this.enumsCaixaDialogNivel01 ==
          EnumsCaixaDialogNivel01.caixaAtributos) {
        return TextosDeComponentesNivel01.tituloCaixaDialogoAtributos;
      } else {
        return TextosDeComponentesNivel01.tituloCaixaDialogoMetodos;
      }
    } else if (tipoDeTexto == textoQntDePontos) {
      if (this.enumsCaixaDialogNivel01 ==
          EnumsCaixaDialogNivel01.caixaAtributos) {
        return TextosDeComponentesNivel01.qntDePontosCaixaDialogoAtributos;
      } else {
        return TextosDeComponentesNivel01.qntDePontosCaixaDialogoMetodos;
      }
    }
  }
}
