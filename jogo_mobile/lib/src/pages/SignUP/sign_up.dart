import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controleSingUp.dart';
import 'package:jogo_mobile/src/pages/Widgets/ClipperContainerSuperior.dart';
import 'package:jogo_mobile/src/pages/Widgets/appButton.dart';
import 'package:jogo_mobile/src/pages/Widgets/appTextFormatFild.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

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
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.3,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                            },
                            child: Text(
                              "Já sou cadastrado",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
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

  _onpressedFunction(){
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

    setState(() {
      _showProgress = true;
    });

    // final service = FirebaseService();
    // final response = await service.cadastrarUser(nome, email, senha);

    // if (response.ok) {
    //   Navigator.pushNamed(context, "/EscolhaDeNivel");
    // } else {
    //   alertNotificacao(context, response.msg);
    // }
    controleSignUp.salvarUsuario(context, nome, email, senha, senhaRepetida);
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
