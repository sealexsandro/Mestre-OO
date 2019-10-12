import 'package:flutter/material.dart';
import 'package:jogo_mobile/pages/componentes/containerDeClasses.dart';
import 'package:jogo_mobile/pages/componentes/iconesComponent.dart';
import 'package:jogo_mobile/pages/componentesFase1/botaoEscolherAtributos.dart';

class DiagramaDeClassesPetShop extends StatefulWidget {
  @override
  _DiagramaDeClassesPetShopState createState() =>
      _DiagramaDeClassesPetShopState();
}

class _DiagramaDeClassesPetShopState extends State<DiagramaDeClassesPetShop> {
  bool _isChecked = true;
  List _myActivities;
  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
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
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blue),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         top: 16, left: 8.0, right: 8, bottom: 5),
                //     child: Row(
                //       //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: <Widget>[
                //         Padding(
                //           padding: const EdgeInsets.only(
                //               top: 0, left: 6.0, right: 50),
                //           child: Text(
                //             "PET-SHOP",
                //             textAlign: TextAlign.justify,
                //             style: TextStyle(
                //               fontSize: 15,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(
                //             top: 0,
                //             left: 50,
                //           ),
                //           child: Text(
                //             "Score:",
                //             textAlign: TextAlign.justify,
                //             style: TextStyle(
                //               fontSize: 15,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
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
                    "Classe 1 - PET SHOP".toUpperCase(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
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
                        ContainerDeClasse(),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            FlightBookButton(),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            FlightBookButton(),
                            // Container(
                            //   margin: EdgeInsets.only(top: 15),
                            //   width: MediaQuery.of(context).size.width / 2.5,
                            //   height: 60,
                            //   decoration: BoxDecoration(
                            //     gradient: LinearGradient(
                            //       colors: [
                            //         Color(0xFF6078ea),
                            //         Color(0xFF17ead9),
                            //       ],
                            //     ),
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(20),
                            //     ),
                            //   ),
                            // child: FlatButton(
                            //   child: Padding(
                            //     padding: EdgeInsets.only(left: 20),
                            //     child: Text(
                            //       "Escolher Métodos".toUpperCase(),
                            //       style: TextStyle(
                            //         fontSize: 15,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            //   onPressed: () {
                            //     // showModalBottomSheet<void>(
                            //     //     context: context,
                            //     //     builder: (BuildContext context) {
                            //     //       return Center(
                            //     //       child: Container(
                            //     //         child: Padding(
                            //     //           padding: const EdgeInsets.all(32.0),
                            //     //           child: Text(
                            //     //             'This is the modal bottom sheet. Slide down to dismiss.',
                            //     //             textAlign: TextAlign.center,
                            //     //             style: TextStyle(
                            //     //               color: Theme.of(context)
                            //     //                   .accentColor,
                            //     //               fontSize: 24.0,
                            //     //             ),
                            //     //           ),
                            //     //         ),
                            //     //       ),);
                            //     //     });
                            //   },
                            // ),
                            // ),
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
}
