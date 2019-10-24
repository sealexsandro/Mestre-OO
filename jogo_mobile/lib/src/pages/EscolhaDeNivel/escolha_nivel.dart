import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/pages/Widgets/ClipperContainerSuperior.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

class EscolhaDeNivel extends StatefulWidget {
  @override
  _EscolhaDeNivelState createState() => _EscolhaDeNivelState();
}

class _EscolhaDeNivelState extends State<EscolhaDeNivel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voltar"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                ClipPath(
                  clipper: ClipContainerSuperior(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF6078ea),
                            Color(0xFF17ead9),
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        Align(
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 32, bottom: 50),
                            child: Text(
                              "Nome do Jogo",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.45,
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width / 1.2,
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
                              "Classes".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/Nivel01");
                          },
                        ),
                      ),

                      //////////////////Botão de segunda Fase logo abaixo///////////////
                      // Container(
                      //   margin: EdgeInsets.only(top: 15),
                      //   width: MediaQuery.of(context).size.width / 1.2,
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       colors: [
                      //         Color(0xFF6078ea),
                      //         Color(0xFF17ead9),
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(40),
                      //     ),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       "Objetos".toUpperCase(),
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      //////////////////Botão da terceria Fase logo abaixo///////////////
                      // Container(
                      //   margin: EdgeInsets.only(top: 15),
                      //   width: MediaQuery.of(context).size.width / 1.2,
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       colors: [
                      //         Color(0xFF6078ea),
                      //         Color(0xFF17ead9),
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(40),
                      //     ),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       "Encapsulamento".toUpperCase(),
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      //////////////////Botão da Quarta Fase logo abaixo///////////////
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width / 1.2,
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
                        child: Center(
                          child: Text(
                            "Herança".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
