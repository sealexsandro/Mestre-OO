import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/model/ClasseGenerica.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/button_widget.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/caixa_dialog.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/containerDeClasses.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/componentes/mixedLabels.dart';
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
  ContainerDeClasse _containerDeClasse;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    this.textosDeComponentesFase1 = new TextosDeComponentesFase1();
    this.controleNivel01 = Provider.of<ControleNivel01>(context, listen: false);
    this._classeGenerica = controleNivel01.retornaClasseDaRodada();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Construindo Classes"),
        centerTitle: true,
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
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.only(top: 10, bottom: 10, left: 16),
                        child: Text(
                          "Problema    01",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        //  width: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.only(top: 10, bottom: 10, left: 16),
                        child: Text(
                          "Score: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
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
                        this._container(),
                        // ContainerDeClasse(
                        //     this._classeGenerica.nomeDaClasse, controleNivel01),
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
                                  MediaQuery.of(context).size.width / 3,
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
                                  MediaQuery.of(context).size.width / 3,
                              corDoButao: Colors.deepOrange,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width / 3,
                              height: 60,
                              child: Text(
                                "Total de Pontos da rodada:",
                                style: TextStyle(
                                  fontSize: 15,
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

  _container() {
    return this._containerDeClasse =
        ContainerDeClasse(this._classeGenerica.nomeDaClasse);
  }

  _nomeDoSistema() {
    return Text(
      this._classeGenerica.nomeDoProblema,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _escolherTextoProblema() {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          children: <TextSpan>[
            new TextSpan(text: "Escolha atributos e métodos para a classe "),
            // "Construa a classe a seguir escolhendo os atributos e métodos que melhor representam as características e comportamentos da classe "),
            new TextSpan(
              text: this._classeGenerica.nomeDaClasse,
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
            new TextSpan(
              text: "  abaixo: ",
            ),
          ],
        ),
      ),
    );
  }

  escolhaDeAtributos() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CaixaDialog(
        classeGenerica: this._classeGenerica,
        enumsCaixaDialogNivel01: EnumsCaixaDialogNivel01.caixaAtributos,
      ),
    );
  }

  escolhaDeMetodos() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CaixaDialog(
        classeGenerica: this._classeGenerica,
        enumsCaixaDialogNivel01: EnumsCaixaDialogNivel01.caixaMetodos,
      ),
    );
  }

  validarClasse() {
    if (this.controleNivel01.validarClasse(context) == true) {
      debugPrint("É pra repintar a tela!");
      this._classeGenerica = controleNivel01.retornaClasseDaRodada();
      //    if (this._classeGenerica != null) {
      setState(() {
        this.textosDeComponentesFase1 = new TextosDeComponentesFase1();
        this._containerDeClasse.listaDeAtributos.clear();
        this._containerDeClasse.listaDeMetodos.clear();
      });
      //   }
    }
  }
}
