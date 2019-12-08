import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/Controle_ProblemasNivel01.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/pages/Widgets/DrawerList.dart';
import 'package:provider/provider.dart';

class EscolhaDeProblemasNivel01 extends StatefulWidget {
  @override
  _EscolhaDeProblemasFase1State createState() =>
      _EscolhaDeProblemasFase1State();
}

class _EscolhaDeProblemasFase1State extends State<EscolhaDeProblemasNivel01> {
  ControleTelaProblemasNivel01 controle;
  Fachada fachada;
  String pontos = "AA";

  @override
  void initState() {
    super.initState();
    this.fachada = Fachada.getUnicaInstanciaFachada();
    //  PontosJogador.clear();
    this.pontos = Provider.of<ControleNivel01>(context, listen: false)
        .scoreTotal
        .toString();
    this.controle = new ControleTelaProblemasNivel01(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: pontuacaoJogador(),
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
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 25, top: 30),
                child: Text(
                  "Escolha um tipo de Sistema abaixo e, avance construindo classes para o sistema escolhido:",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "WorkSansMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                            dialogInformativoDoSistema(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            dialogInformativoDoSistema(
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
                            dialogInformativoDoSistema(
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
                    SizedBox(
                      height: 20,
                    ),
                    pontuacaoJogador(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  dialogInformativoDoSistema(TipoDeProblema tipoDeProblema) {
    this.controle.dialogInformativo(tipoDeProblema);
  }

  pontuacaoJog() async {}

  pontuacaoJogador() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      RichText(
        textAlign: TextAlign.right,
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 17,
            color: Colors.black87,
          ),
          children: <TextSpan>[
            new TextSpan(
              text: "Score: ",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            // "Construa a classe a seguir escolhendo os atributos e métodos que melhor representam as características e comportamentos da classe "),
            new TextSpan(
              text: "${this.pontos.toString()} ",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            new TextSpan(
              text: "pts        ",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  // pegarPontuacaoJogador() {
  //   // print("Pontos do Jogador: ");
  //   print("cccccccccccccccccc ${this.controle.pegarPontuacaoJogador()}");
  //   //  String pontos = this.controle.pegarPontuacaoJogador();
  //   if (pontos.toString() != null) {
  //     return pontos;
  //   }
  //   return "0";
  // }
}
