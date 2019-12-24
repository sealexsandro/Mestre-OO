import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controleSingUp.dart';
import 'package:jogo_mobile/src/pages/Login/login.dart';
import 'package:jogo_mobile/src/pages/Widgets/ClipperContainerSuperior.dart';
import 'package:jogo_mobile/src/pages/Widgets/appButton.dart';
import 'package:jogo_mobile/src/pages/Widgets/appTextFormatFild.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';
import 'package:jogo_mobile/src/pages/utilsPages/alertNotificacao.dart';
import 'package:jogo_mobile/utils/navegacao.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _tNomeUser = TextEditingController();
  final _tEmail = TextEditingController();
  final _tSenha = TextEditingController();
  final _tRepitaSenha = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusSenha = FocusNode();
  final _focusRepitaSenha = FocusNode();
  bool _showProgress = false;
  final controleSignUp = new ControleSignUp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  ClipPath(
                    clipper: ClipContainerSuperior(),
                    child: Image.asset(
                      'assets/images/img6.png',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.3,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //  height: MediaQuery.of(context).size.height / 1.45,
                    padding: EdgeInsets.only(top: 0),
                    child: Column(
                      children: <Widget>[
                        AppTextFormatField(
                          nomeDoCampo: NomeIcone.nomeDoUser,
                          controller: _tNomeUser,
                          larguraDoContainer: 55,
                          validator: _validateNomeUser,
                          textInputAction: TextInputAction.next,
                          nextFocus: _focusEmail,
                        ),
                        AppTextFormatField(
                          nomeDoCampo: NomeIcone.email,
                          controller: _tEmail,
                          larguraDoContainer: 55,
                          validator: _validateEmail,
                          textInputAction: TextInputAction.next,
                          nextFocus: _focusSenha,
                        ),
                        AppTextFormatField(
                          nomeDoCampo: NomeIcone.senha,
                          controller: _tSenha,
                          larguraDoContainer: 55,
                          validator: _validateSenha,
                          textInputAction: TextInputAction.next,
                          nextFocus: _focusRepitaSenha,
                        ),
                        AppTextFormatField(
                          nomeDoCampo: NomeIcone.repitaASenha,
                          controller: _tRepitaSenha,
                          larguraDoContainer: 55,
                          validator: _validateSenhaRepitida,
                          textInputAction: TextInputAction.next,
                          nextFocus: _focusRepitaSenha,
                        ),
                        AppButton(
                          textoDoButao: "salvar",
                          funcaoDoButao: _onpressedFunction,
                          showProgress: _showProgress,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0),
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
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              pushReplacement(context, Login());
                            },
                            child: Text(
                              "Já sou cadastrado",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 19,
                                  fontFamily: "WorkSansMedium"),
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
      ),
    );
  }

  _validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      alertNotificacao(context, "Email inválido");
      return false;
    } else {
      return true;
    }
  }

  _onpressedFunction() {
    bool formKey = _formKey.currentState.validate();
    if (!formKey) {
      return;
    }
    String nome = _tNomeUser.text;
    String email = _tEmail.text;
    String senha = _tSenha.text;
    String senhaRepetida = _tRepitaSenha.text;

    print("Nome : ${nome.toString()}");
    print("Email : ${email.toString()}");
    print("senha: ${senha.toString()}");
    print("Senha repitida : ${senhaRepetida.toString()}");

    // final service = FirebaseService();
    // final response = await service.cadastrarUser(nome, email, senha);

    // if (response.ok) {
    //   Navigator.pushNamed(context, "/EscolhaDeNivel");
    // } else {
    //   alertNotificacao(context, response.msg);
    // }
    var verificarEmail = _validarEmail(email);
    if (verificarEmail) {
      controleSignUp.salvarUsuario(context, nome, email, senha, senhaRepetida);

      setState(() {
        _showProgress = true;
      });
    }
    setState(() {
      _showProgress = false;
    });
  }

  String _validateNomeUser(String text) {
    if (text.isEmpty) {
      return "Digite seu Nome de Usuário";
    }
    return null;
  }

  String _validateEmail(String text) {
    if (text.isEmpty) {
      return "Digite seu E-mail";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite sua Senha";
    }
    return null;
  }

  String _validateSenhaRepitida(String text) {
    if (text.isEmpty) {
      return "Digite Novamente sua Senha";
    }
    return null;
  }
}
