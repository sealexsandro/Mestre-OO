import 'package:flutter/material.dart';
import 'package:jogo_mobile/pages/componentes/containerDeClasses.dart';
import 'package:jogo_mobile/pages/componentes/iconesComponent.dart';

class DiagramaDeClassesPetShop extends StatefulWidget {
  @override
  _DiagramaDeClassesPetShopState createState() =>
      _DiagramaDeClassesPetShopState();
}

class _DiagramaDeClassesPetShopState extends State<DiagramaDeClassesPetShop> {
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 8.0, right: 8, bottom: 5),
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 6.0, right: 30),
                          child: Text(
                            "Construção de Classes",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                            left: 20,
                          ),
                          child: Text(
                            "Score:",
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
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 8.0, right: 8, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 8.0, right: 8),
                          child: Text(
                            "Problema 1: ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 0, left: 30, right: 8),
                          child: Text(
                            "PET-SHOP",
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 8),
                  child: Text(
                    "Crie uma classe abaixo escolhendo os atributos e métodos que melhor representam as características e compotamentos da classe solicitada: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ContainerDeClasse(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 60,
                              child: Center(
                                child: Text(
                                  "Pontos:".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6078ea),
                                    Color(0xFF17ead9),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: FlatButton(
                                child: Center(
                                  child: Text(
                                    "Escolher Atributos".toUpperCase(),
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
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6078ea),
                                    Color(0xFF17ead9),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: FlatButton(
                                child: Center(
                                  child: Text(
                                    "Escolher Métodos".toUpperCase(),
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
                        )
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
                      Radius.circular(40),
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

  Container containerCamposTextFild(String nomeDoCampo) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 55,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(
        top: 4,
        left: 16,
        right: 16,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
            )
          ]),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: IconesComponent.escolhaDeIcone(nomeDoCampo),
          hintText: nomeDoCampo,
        ),
      ),
    );
  }
}
