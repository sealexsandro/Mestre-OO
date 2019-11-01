import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo_mobile/src/controller/controle_Login.dart';
import 'package:jogo_mobile/src/model/ApiResponse.dart';
import 'package:jogo_mobile/src/pages/Widgets/ClipperContainerSuperior.dart';
import 'package:jogo_mobile/src/pages/Widgets/appButton.dart';
import 'package:jogo_mobile/src/pages/Widgets/appTextFormatFild.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';
import 'package:jogo_mobile/src/pages/utilsPages/alertNotificacao.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _focusSenha = FocusNode();
  bool _showProgress = false;

  final _controleLogin = ControleLogin();

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
        Form(
          key: _formKey,
          child: Container(
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
                              "Mestre OO",
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
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "WorkSansMedium",
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      AppTextFormatField(
                        nomeDoCampo: NomeIconeComponent.nomeDoUser,
                        controller: _tLogin,
                        validator: _validateLogin,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        nextFocus: _focusSenha,
                      ),
                      AppTextFormatField(
                        nomeDoCampo: NomeIconeComponent.senha,
                        password: true,
                        controller: _tSenha,
                        validator: _validateSenha,
                        focusNode: _focusSenha,
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //       top: 16,
                      //       right: 34,
                      //     ),
                      //     child: Text(
                      //       "Esqueci a Senha",
                      //       style: TextStyle(fontSize: 16, color: Colors.grey),
                      //     ),
                      //   ),
                      // ),
                      AppButton(
                        textoDoButao: "Entre",
                        funcaoDoButao: onPressedFunction,
                        showProgress: _showProgress,
                      ),
                      //  AppButton("Entre", onPressedFunction),
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
                                padding:
                                    EdgeInsets.only(left: 15.0, right: 15.0),
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
        ),
      ],
    );
  }

  onPressedFunction() async {
  //  Navigator.pushNamed(context, "/EscolhaDeNivel");

    bool formKey = _formKey.currentState.validate();
    if (!formKey) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;

    // debugPrint("Login: ${login}");
    // debugPrint("Senha: ${senha.toString()}");

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await _controleLogin.login(login, senha);

    if (response.ok) {
      
      Navigator.pushNamed(context, "/EscolhaDeNivel");
    } else {
      alertNotificacao(context, response.msg);
      debugPrint("Acesso negado");
    }

    setState(() {
      _showProgress = false;
    });
  }

  onPressedGoogleLogin() {
    Navigator.pushNamed(context, "/EscolhaDeNivel");
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite seu Login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite sua Senha";
    }
    return null;
  }
}
