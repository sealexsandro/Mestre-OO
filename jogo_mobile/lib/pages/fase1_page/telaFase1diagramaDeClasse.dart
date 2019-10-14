import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_mobile/models/ClasseGenerica.dart';
import 'package:jogo_mobile/pages/fase1_page/componentes/butao_DialogDeInformacao.dart';
import 'package:jogo_mobile/pages/fase1_page/componentes/containerDeClasses.dart';

class Fase1_Classes extends StatefulWidget {
  @override
  _Fase1_ClassesState createState() =>
      _Fase1_ClassesState();
}

class _Fase1_ClassesState extends State<Fase1_Classes> {
  List<EnumsNomesDeClasses> listaNomesDeClasses;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    iniciarLista();
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
                  child: Text(
                    "Sistema Pet Shop",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 8),
                  child: Text(
                    "Crie uma classe abaixo escolhendo os atributos e métodos que melhor representam as características e compotamentos da classe solicitada: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        //  ContainerDeClasse(),
                        diagramaDeClasse(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _butaoDialogDeAtributos("escolha atributos"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            _butaodialogDeMetodos("escolha métodos"),
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

  _butaoDialogDeAtributos(String textoDoButao) {
     return ButaoCaixaDeDialogo(textoDoButao);
  }

  _butaodialogDeMetodos(String textoDoButao) {
    return ButaoCaixaDeDialogo(textoDoButao);
  }

  iniciarLista() {
    listaNomesDeClasses = [];

    EnumsNomesDeClasses.values.forEach((nomeDaClasse) {
      listaNomesDeClasses.add(nomeDaClasse);
    });
  }

  diagramaDeClasse() {
    listaNomesDeClasses.shuffle();
    int randomNumber = random.nextInt(listaNomesDeClasses.length);
    EnumsNomesDeClasses nomeDaClasse = listaNomesDeClasses[randomNumber];
    listaNomesDeClasses.remove(randomNumber);
    return ContainerDeClasse(nomeDaClasse);
  }
}
