import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/button_widget.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/caixa_dialog.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/containerDeClasses.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/enums_da_fase1.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/textos_da_fase1.dart';
import 'package:provider/provider.dart';

class Nivel01 extends StatefulWidget {
  @override
  _Nivel01State createState() => _Nivel01State();
}

class _Nivel01State extends State<Nivel01> {
  String nomeAleatorioDaClasse;
  ClasseGenerica _classeGenerica;
  ControleNivel01 controleNivel01;
  TextosDeComponentesFase1 textosDeComponentesFase1;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    this.textosDeComponentesFase1 = new TextosDeComponentesFase1();
    this.controleNivel01 =
        Provider.of<ControleNivel01>(context, listen: false);
    this._classeGenerica = controleNivel01.retornaClasseDaRodada();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("   NOME DO JOGO "),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, left: 8.0, right: 8, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // children: <Widget>[
                          //   Padding(
                          //     padding: const EdgeInsets.only(
                          //         top: 0, left: 8.0, right: 8),
                          //     child: Text(
                          //       "Pontos Por Atributo Certo:",
                          //       textAlign: TextAlign.justify,
                          //       style: TextStyle(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 8.0, right: 8, bottom: 5),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: <Widget>[
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             top: 0, left: 8.0, right: 8),
                      //         child: Text(
                      //           "Pontos Por Método Certo:",
                      //           textAlign: TextAlign.justify,
                      //           style: TextStyle(
                      //             fontSize: 15,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 8.0, right: 8),
                              child: Text(
                                "SCORE:",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 8),
                  child: _nomeDoSistema(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 8),
                  child: _escolherTextoProblema(),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ContainerDeClasse("nomeDaClasse"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ButtonWidget(
                              "escolha atributos",
                              onPressedFunction: escolhaDeAtributos,
                              alturaDoButao: 60,
                              comprimentoDoButao:
                                  MediaQuery.of(context).size.width / 2.5,
                              corDoButao: Colors.deepOrange,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            ButtonWidget(
                              "escolha métodos",
                              onPressedFunction: escolhaDeMetodos,
                              alturaDoButao: 60,
                              comprimentoDoButao:
                                  MediaQuery.of(context).size.width / 2.5,
                              corDoButao: Colors.deepOrange,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 60,
                              child: Text(
                                "Total de Pontos da rodada:".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                ButtonWidget(
                  "Validar Classe",
                  onPressedFunction: validarClasse,
                  alturaDoButao: 60,
                  comprimentoDoButao: MediaQuery.of(context).size.width / 1.5,
                  corDoButao: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _nomeDoSistema() {
    Text(
      this._classeGenerica.nomeDoProblema,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _escolherTextoProblema() {
    return RichText(
      textAlign: TextAlign.justify,
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(
              text:
                  "Crie uma classe abaixo escolhendo os atributos e métodos que melhor representam as características e compotamentos da classe "),
          new TextSpan(
              text: this._classeGenerica.nomeDaClasse + " :",
              style: new TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  escolhaDeAtributos() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CaixaDialog(
        classeGenerica: this._classeGenerica,
        tituloDoContainer:
            this.textosDeComponentesFase1.tituloCaixaDialogoAtributos,
        textoQntDePontos:
            this.textosDeComponentesFase1.QntDePontosCaixaDialogoAtributos,
        enumsFase1CaixaDeDialog: EnumsFase1CaixaDeDialog.caixaAtributos,
      ),
    );
  }

  escolhaDeMetodos() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CaixaDialog(
        classeGenerica: this._classeGenerica,
        tituloDoContainer:
            this.textosDeComponentesFase1.tituloCaixaDialogoMetodos,
        textoQntDePontos:
            this.textosDeComponentesFase1.textoQntDePontosCaixaDialogoMetodos,
        enumsFase1CaixaDeDialog: EnumsFase1CaixaDeDialog.caixaMetodos,
      ),
    );
  }

  validarClasse() {}
}
