import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeProblemasNivel01/textosInformativos.dart';
import 'package:provider/provider.dart';

class DialogInfoSistema extends StatefulWidget {
  final TipoDeProblema tipoDeProblema;
  BuildContext contextAnterior;

  DialogInfoSistema(this.tipoDeProblema, this.contextAnterior);

  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<DialogInfoSistema> {
  ControleNivel01 controleNivel01;
  TipoDeProblema tipoDeProblema;
  TextoInformativo textoInformativo;
  BuildContext contextAnterior;

  @override
  void initState() {
    super.initState();
    this.tipoDeProblema = widget.tipoDeProblema;
    this.contextAnterior = widget.contextAnterior;
    this.controleNivel01 =
        Provider.of<ControleNivel01>(contextAnterior, listen: false);
    this.textoInformativo = TextoInformativo();
    this.contextAnterior = widget.contextAnterior;
  }

  @override
  Widget build(BuildContext context) {
    return dialogContent(context);
  }

  Widget dialogContent(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.15,
        height: MediaQuery.of(context).size.height / 1.6,
        //    padding: EdgeInsets.all(5),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 18,
              ),
              margin: EdgeInsets.only(top: 13.0, right: 8.0),
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
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 7),
                    child: Text(
                      "Informações sobre o Sistema",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54,
                        fontFamily: "Roboto",
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  inserirTexto(),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  Center(
                    child: RaisedButton(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 25,
                        right: 25,
                      ),
                      child: Text(
                        "Avançar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        controleNivel01.iniciarTelaNivel01(
                            this.contextAnterior, tipoDeProblema);
                      },
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
                    radius: 22,
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

  inserirTexto() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.23,
      height: MediaQuery.of(contextAnterior).size.height / 2.5,

      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          solicitarTexto(this.tipoDeProblema),
        ],
      ),
    );
  }

  solicitarTexto(TipoDeProblema tipoDeProblema) {
    switch (tipoDeProblema) {
      case TipoDeProblema.sistemaLocadoraDeCarro:
        return this.textoInformativo.textLocadora;
      // case TipoDeProblema.sistemaLocadoraDeCarro:
      //   return "Sistema Para Locadora De Veículos";
      case TipoDeProblema.sitemaClinicaMedica:
        return this.textoInformativo.textClinicaMedica;

      case TipoDeProblema.sistemaPetShop:
        return this.textoInformativo.textPetShop;

      default:
        return "Não encontrou Nenhum Tipo de Classe Solicitada!";
    }
  }
}
