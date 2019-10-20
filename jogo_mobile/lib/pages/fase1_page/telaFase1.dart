import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/model/ClasseGenerica.dart';
import 'package:jogo_mobile/pages/fase1_page/atributosBloc.dart';
import 'package:jogo_mobile/pages/fase1_page/componentes/button_widget.dart';
import 'package:jogo_mobile/pages/fase1_page/componentes/caixa_dialog.dart';
import 'package:jogo_mobile/pages/fase1_page/componentes/containerDeClasses.dart';
import 'package:provider/provider.dart';

class Fase1_Classes extends StatefulWidget {
  @override
  _Fase1_ClassesState createState() => _Fase1_ClassesState();
}

class _Fase1_ClassesState extends State<Fase1_Classes> {
  String nomeAleatorioDaClasse;
  ClasseGenerica _classeGenerica;
  TransferirdadosDaClasseBloc bloc;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    this.bloc =
        Provider.of<TransferirdadosDaClasseBloc>(context, listen: false);
    this._classeGenerica = bloc.retornaClasseDaRodada();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   this.bloc = Provider.of<TransferirdadosDaClasseBloc>(context);
  //   this._classeGenerica = bloc.retornaClasseDaRodada();
  // }

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
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 8.0, right: 8),
                              child: Text(
                                "Pontos Por Atributo Certo:",
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
                                "Pontos Por Método Certo:",
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
                            ButtonWidget("escolha atributos",
                                onPressedFunction: escolhaDeAtributos),
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                        //    // _butaodialogDeMetodos("escolha métodos"),
                        //   ],
                        // ),
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
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF6078ea),
                        Color(0xFF17ead9),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: FlatButton(
                    child: Center(
                      child: Text(
                        "Validar Classe".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
        builder: (BuildContext context) => CustomDialog(this._classeGenerica));
  }

  _butaodialogDeMetodos(String textoDoButao) {
    //  return ButaoCaixaDeDialogo(textoDoButao, this._classeGenerica);
  }

}
