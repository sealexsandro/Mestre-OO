import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/pages/Widgets/button_widget.dart';
import 'package:provider/provider.dart';

class LicaoConcluida extends StatefulWidget {
  @override
  _LicaoConcluidaState createState() => _LicaoConcluidaState();
}

class _LicaoConcluidaState extends State<LicaoConcluida> {
  ControleNivel01 controle;
  @override
  void initState() {
    super.initState();
    this.controle = Provider.of<ControleNivel01>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lição Concluida",
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5, bottom: 0, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Classes Construídas Com Sucesso",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "WorkSansMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                 width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(0),
                child: Text(
                  "+20 Pontos Pelo desempenho",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "WorkSansMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonWidget(
                    "Avançar",
                    onPressedFunction: nextScreen,
                    alturaDoButao: 70,
                    comprimentoDoButao: MediaQuery.of(context).size.width / 1.7,
                    corDoButao: Colors.blueAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  nextScreen() {
     this.controle.exibirTelaEscolhaDeSistemas();
  }
}
