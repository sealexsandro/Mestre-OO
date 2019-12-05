import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/ControleConfiguracoes.dart';
import 'package:jogo_mobile/src/fachada/fachada.dart';
import 'package:jogo_mobile/src/model/usuario.dart';
import 'package:jogo_mobile/src/pages/Widgets/appButton.dart';
import 'package:jogo_mobile/src/pages/Widgets/appTextFormatFild.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

class EditarUser extends StatefulWidget {
  ControleConfiguracoes controleConfig;

  EditarUser(ControleConfiguracoes controleConfig) {
    this.controleConfig = controleConfig;
  }
  @override
  _EditarUserState createState() => _EditarUserState();
}

class _EditarUserState extends State<EditarUser> {
  final _formKey = GlobalKey<FormState>();
  final _tNomeUser = TextEditingController();
  final _tEmail = TextEditingController();
  String nomeAntigo = "", senhaAntiga = "", emailAntigo = "";
  final _tSenha = TextEditingController();
  final _tRepitaSenha = TextEditingController();
  final _focusUser = FocusNode();
  bool _showProgress = false;
  ControleConfiguracoes controleConfig;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.controleConfig = widget.controleConfig;
    escreverEmailSenha();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      //   child: dialogContent(context),
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 1.9,
        //    margin: EdgeInsets.only(left: 0.0, right: 0.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, right: 7, left: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "Atualizar Conta".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //  height: MediaQuery.of(context).size.height / 1.45,
                      padding: EdgeInsets.only(top: 30, right: 8, left: 8),
                      child: Column(
                        children: <Widget>[
                          AppTextFormatField(
                            nomeDoCampo: NomeIcone.email,
                            controller: _tEmail,
                            larguraDoContainer: 55,
                            validator: _validateEmail,
                            textInputAction: TextInputAction.next,
                            nextFocus: _focusUser,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextFormatField(
                            nomeDoCampo: NomeIcone.nomeDoUser,
                            controller: _tNomeUser,
                            larguraDoContainer: 55,
                            validator: _validateNomeUser,
                            //  textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppButton(
                            textoDoButao: "salvar",
                            funcaoDoButao: _onpressedFunction,
                            showProgress: _showProgress,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onpressedFunction() {
    bool formKey = _formKey.currentState.validate();
    if (!formKey) {
      return;
    }
    String nome = _tNomeUser.text;
    String email = _tEmail.text;
    String senha = _tSenha.text;

    print("Nome : ${nomeAntigo.toString()}");
    print("Email : ${emailAntigo.toString()}");
    print("senha: ${senhaAntiga.toString()}");

    setState(() {
      _showProgress = true;
    });
    this.controleConfig.atualizarUsuario(context, 1, emailAntigo, email,
        nomeAntigo, nome, senhaAntiga, senhaAntiga);
    Navigator.pop(context);
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

  void escreverEmailSenha() {
    Fachada fachada = Fachada.getUnicaInstanciaFachada();

    Future<Usuario> userFuture = fachada.getUsuario();
    userFuture.then((Usuario user) {
      if (user != null) {
        this._tNomeUser.text = user.nome;
        this._tEmail.text = user.email;
        this._tSenha.text = user.senha;
        this.emailAntigo = user.email;
        this.nomeAntigo = user.nome;
        this.senhaAntiga = user.senha;
      }
    });
  }
}
