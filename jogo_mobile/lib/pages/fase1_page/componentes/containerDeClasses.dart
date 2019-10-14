import 'package:flutter/material.dart';
import 'package:jogo_mobile/models/ClasseGenerica.dart';
import 'package:jogo_mobile/pages/fase1_page/atributosBloc.dart';
import 'package:provider/provider.dart';

class ContainerDeClasse extends StatefulWidget {
  EnumsNomesDeClasses nomeDaClasse;
  ContainerDeClasse(EnumsNomesDeClasses nomeDaClasse) {
    this.nomeDaClasse = nomeDaClasse;
  }

  @override
  _ContainerDeClasseState createState() =>
      _ContainerDeClasseState(this.nomeDaClasse);
}

class _ContainerDeClasseState extends State<ContainerDeClasse> {
  EnumsNomesDeClasses nomeDaClasse;
  List<String> listaDeAtributos = [];

  _ContainerDeClasseState(EnumsNomesDeClasses nomeDaClasse) {
    this.nomeDaClasse = nomeDaClasse;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 30,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                ),
              ),
            ),
            child: Center(
              child: Text(textNomeDaClasse(this.nomeDaClasse).toUpperCase()),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            height: 130,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                ),
              ),
            ),
            child: linhaDeAtributo(),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.1,
            //height: 130,
            // decoration: BoxDecoration(
            //   border: Border(
            //     top: BorderSide(
            //       width: 1.0,
            //       color: Colors.blue,
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  String textNomeDaClasse(EnumsNomesDeClasses nomeDaClasse) {
    return NomesGenericosParaClasses.getNomesGenericoDeClasse(nomeDaClasse);
  }

  linhaDeAtributo() {
    TransferirdadosDaClasseBloc nomeDoAtributo =
        Provider.of<TransferirdadosDaClasseBloc>(context);
    String atrib = nomeDoAtributo.atributo;

    if (atrib != null) {
      listaDeAtributos.add(atrib);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: listaDeAtributos.map((card) {
          return Text(card);
        }).toList(),
      );
    }
  }
}
