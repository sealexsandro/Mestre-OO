import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/Controle_ProblemasNivel01.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/dialogInfoSistema.dart';
import 'package:jogo_mobile/src/pages/Widgets/DrawerList.dart';

class EscolhaDeProblemasNivel01 extends StatefulWidget {
  @override
  _EscolhaDeProblemasFase1State createState() =>
      _EscolhaDeProblemasFase1State();
}

class _EscolhaDeProblemasFase1State extends State<EscolhaDeProblemasNivel01> {
  ControleTelaProblemasNivel01 controle;
  @override
  void initState() {
    super.initState();
    this.controle = new ControleTelaProblemasNivel01(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Construa Classes",
        ),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              // ClipPath(
              //   clipper: ClipContainerSuperior(),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height / 3.8,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [
              //             Color(0xFF6078ea),
              //             Color(0xFF17ead9),
              //           ]),
              //     ),
              //     child: Image.asset('assets/images/img3.jpg'),

              //     // child: Column(
              //     //   mainAxisAlignment: MainAxisAlignment.center,
              //     //   children: <Widget>[
              //     //     Spacer(),
              //     //     Align(
              //     //       child: Icon(
              //     //         Icons.person,
              //     //         size: 80,
              //     //         color: Colors.white,
              //     //       ),
              //     //     ),
              //     //     Spacer(),

              //     //   ],
              //     // ),
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 25, top: 30),
                child: Text(
                  "Escolha um tipo de negócio abaixo e, avance montando classes para futuros sistemas que irão atendê-los:",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "WorkSansMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.45,
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //  nextScreen(TipoDeProblema.sitemaClinicaMedica);
                            dialogInformativo(
                                TipoDeProblema.sitemaClinicaMedica);
                          },
                          child: ClipOval(
                            child: Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width / 2.8,
                              height: MediaQuery.of(context).size.height / 5.7,
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Clínica Médica",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                          //  nextScreen(TipoDeProblema.sistemaPetShop);
                            dialogInformativo(
                                TipoDeProblema.sistemaPetShop);
                          },
                          child: ClipOval(
                            child: Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width / 2.8,
                              height: MediaQuery.of(context).size.height / 5.7,
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Pet Shop",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialogInformativo(
                                TipoDeProblema.sistemaLocadoraDeCarro);
                          },
                          child: ClipOval(
                            child: Container(
                              color: Colors.blue,
                              width: MediaQuery.of(context).size.width / 2.8,
                              height: MediaQuery.of(context).size.height / 5.7,
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Locadora de Veículos",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // nextScreen(TipoDeProblema tipoDeProblema) {
  //   this.controle.nextScreen(tipoDeProblema);
  // }

  dialogInformativo(TipoDeProblema tipoDeProblema) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          DialogInfoSistema(tipoDeProblema, this.context),
    );
  }
}
