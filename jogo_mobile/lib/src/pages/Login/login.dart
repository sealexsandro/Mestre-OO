import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:jogo_mobile/src/controller/controle_Login.dart';
import 'package:jogo_mobile/src/pages/Widgets/ClipperContainerSuperior.dart';
import 'package:jogo_mobile/src/pages/Widgets/appButton.dart';
import 'package:jogo_mobile/src/pages/Widgets/appTextFormatFild.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

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
    _controleLogin.pegarUsuarioConectado(context);
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
                      child:
                        Image.asset('assets/images/img6.png', fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.3,
                        ),
                  // child: Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height / 3.5,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter,
                  //         colors: [
                  //           Color(0xFF6078ea),
                  //           Color(0xFF17ead9),
                  //         ]),
                  //   ),
                  //   child:
                  //       Image.asset('assets/images/img4.png', fit: BoxFit.fill,
                  //       ),
                  // ),
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
                // SizedBox(
                //   height: 5,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
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
                        child: GoogleSignInButton(
                          borderRadius: 40,
                          text: "   Usar conta Google",
                          onPressed: onPressedGoogleLogin,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          "Ou use outro e-mail",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppTextFormatField(
                        nomeDoCampo: NomeIcone.email,
                        controller: _tLogin,
                        validator: _validateLogin,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        nextFocus: _focusSenha,
                      ),
                      AppTextFormatField(
                        nomeDoCampo: NomeIcone.senha,
                        controller: _tSenha,
                        validator: _validateSenha,
                        nextFocus: _focusSenha,
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
                        textoDoButao: "Entrar",
                        funcaoDoButao: onPressedFunction,
                        showProgress: _showProgress,
                      ),
                      //    AppButton("Entre", onPressedFunction),

                      // Container(
                      //   width: MediaQuery.of(context).size.width / 1.2,
                      //   child: Padding(
                      //     padding: EdgeInsets.only(top: 20.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: <Widget>[
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             gradient: new LinearGradient(
                      //                 colors: [
                      //                   Colors.black12,
                      //                   Colors.black,
                      //                 ],
                      //                 begin: const FractionalOffset(0.0, 0.0),
                      //                 end: const FractionalOffset(1.0, 1.0),
                      //                 stops: [0.0, 1.0],
                      //                 tileMode: TileMode.clamp),
                      //           ),
                      //           width: 100.0,
                      //           height: 1.0,
                      //         ),
                      //         Padding(
                      //           padding:
                      //               EdgeInsets.only(left: 15.0, right: 15.0),
                      //           child: Text(
                      //             "Ou",
                      //             style: TextStyle(
                      //                 color: Colors.grey,
                      //                 fontSize: 16.0,
                      //                 fontFamily: "WorkSansMedium"),
                      //           ),
                      //         ),
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             gradient: new LinearGradient(
                      //                 colors: [
                      //                   Colors.black,
                      //                   Colors.black12,
                      //                 ],
                      //                 begin: const FractionalOffset(0.0, 0.0),
                      //                 end: const FractionalOffset(1.0, 1.0),
                      //                 stops: [0.0, 1.0],
                      //                 tileMode: TileMode.clamp),
                      //           ),
                      //           width: 100.0,
                      //           height: 1.0,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                                fontSize: 20,
                                fontFamily: "WorkSansMedium",
                                decoration: TextDecoration.underline,
                              ),
                              
                            ),
                          ),
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
    bool formKey = _formKey.currentState.validate();
    if (!formKey) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;
    setState(() {
      _showProgress = true;
    });
    _controleLogin.login(context, login, senha);
    setState(() {
      _showProgress = false;
    });
  }

  onPressedGoogleLogin() {
    this._controleLogin.loginComGoogle(context);
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
