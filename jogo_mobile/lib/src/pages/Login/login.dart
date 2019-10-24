import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo_mobile/src/pages/Widgets/ClipperContainerSuperior.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    containerCamposTextFild(IconesComponent.email,
                        controller: _tLogin),
                    containerCamposTextFild(IconesComponent.senha,
                        password: true, controller: _tSenha),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          right: 34,
                        ),
                        child: Text(
                          "Esqueci a Senha",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
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
                            "Entre".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: onPressedFunction,
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 15),
                    //   width: MediaQuery.of(context).size.width / 1.2,
                    //   height: 60,
                    //   child: GoogleSignInButton(
                    //     borderRadius: 40,
                    //     text: "Entrar com conta Google",
                    //     onPressed: onPressedGoogleLogin,
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                    colors: [
                                      Colors.black12,
                                      Colors.black,
                                    ],
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(1.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              width: 100.0,
                              height: 1.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Text(
                                "Ou",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansMedium"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.black12,
                                    ],
                                    begin: const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(1.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              width: 100.0,
                              height: 1.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/SignUp");
                            },
                            child: Text(
                              "Cadastre-se",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
                                  fontFamily: "WorkSansMedium"),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container containerCamposTextFild(String nomeDoCampo,
      {bool password = false, TextEditingController controller}) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 55,
      margin: EdgeInsets.only(top: 32),
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
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: IconesComponent.escolhaDeIcone(nomeDoCampo),
          hintText: nomeDoCampo,
        ),
      ),
    );
  }

  onPressedFunction() {
    Navigator.pushNamed(context, "/EscolhaDeNivel");
  }

  onPressedGoogleLogin() {
    Navigator.pushNamed(context, "/EscolhaDeNivel");
  }
}
