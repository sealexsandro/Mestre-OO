import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/ControleConfiguracoes.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/EscolhaDeProblemasNivel01.dart';
import 'package:jogo_mobile/src/pages/Widgets/button_widget.dart';
import 'package:jogo_mobile/src/pages/editarUser/editarSenha.dart';
import 'package:jogo_mobile/src/pages/editarUser/editarUser.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class ConfigContaUser extends StatefulWidget {
  @override
  _EscolhaDeProblemasFase1State createState() =>
      _EscolhaDeProblemasFase1State();
}

class _EscolhaDeProblemasFase1State extends State<ConfigContaUser> {
  ControleConfiguracoes controleConfig;

  @override
  void initState() {
    super.initState();
    this.controleConfig = new ControleConfiguracoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Configurações da Conta",
      //   ),
      // ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: ListTile(
            onTap: () {
              print("Item 1");
              nextScreen(context, EscolhaDeProblemasNivel01());
            },
            leading: Icon(Icons.keyboard_backspace, color: Colors.white, size: 30),
            title: Text(
              "Configurações",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   padding: EdgeInsets.only(left: 20, right: 25, top: 30),
              //   child: Text(
              //     "",
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontFamily: "WorkSansMedium",
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black45,
              //     ),
              //     textAlign: TextAlign.justify,
              //   ),
              // ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ButtonWidget(
                              "Editar Login / Nome User",
                              onPressedFunction: telaConfigurarLoginNome,
                              alturaDoButao: 70,
                              comprimentoDoButao:
                                  MediaQuery.of(context).size.width / 1.2,
                              corDoButao: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonWidget(
                          "Editar Senha",
                          onPressedFunction: telaConfigurarSenha,
                          alturaDoButao: 70,
                          comprimentoDoButao:
                              MediaQuery.of(context).size.width / 1.2,
                          corDoButao: Colors.blueAccent,
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

  telaConfigurarLoginNome() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => EditarUser(this.controleConfig),
    );
  }

  telaConfigurarSenha() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => EditarSenha(this.controleConfig),
    );
  }
}
