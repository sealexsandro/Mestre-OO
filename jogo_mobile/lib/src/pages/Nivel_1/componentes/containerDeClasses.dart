import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:provider/provider.dart';

class ContainerDeClasse extends StatefulWidget {
  String nomeDaClasse;
  List<String> listaDeAtributos = [];
  List<String> listaDeMetodos = [];

  ContainerDeClasse(String nomeDaClasse) {
    this.nomeDaClasse = nomeDaClasse;
  }

  @override
  _ContainerDeClasseState createState() =>
      _ContainerDeClasseState(this.nomeDaClasse);
}

class _ContainerDeClasseState extends State<ContainerDeClasse> {
  ControleNivel01 controleNivel01;

  String nomeDaClasse;
  List<String> listaDeAtributos;
  List<String> listaDeMetodos;
  var screnSize;
  var alturaContainer;

  _ContainerDeClasseState(String nomeDaClasse) {
    this.nomeDaClasse = nomeDaClasse;
  }

  @override
  void initState() {
    super.initState();
    this.listaDeAtributos = widget.listaDeAtributos;
    this.listaDeMetodos = widget.listaDeMetodos;
  }

  @override
  Widget build(BuildContext context) {
    this.screnSize = MediaQuery.of(context).size.width / 1.7;
    this.alturaContainer = MediaQuery.of(context).size.height / 2.2;
    return Container(
      width: this.screnSize,
      height: alturaContainer,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Consumer<ControleNivel01>(
        builder: (context, controleNivel01, widget) {
          return colunaDeContainer();
        },
      ),
    );
  }

  colunaDeContainer() {
    return Column(
      children: <Widget>[
        Container(
          width: this.screnSize,
          height: this.alturaContainer / 9,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
          ),
          child: Center(
            child: Text(
              widget.nomeDaClasse,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          width: this.screnSize - 2,
          height: this.alturaContainer / 1.9,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
          ),
          child: Container(
            child: Scrollbar(
              child: listaDinamica(),
            ),
          ),
        ),
        Container(
          width: this.screnSize,
          height: this.alturaContainer / 3,
          child: Container(
            child: Scrollbar(
              child: widgetListaDeMetodos(),
            ),
          ),
        ),
      ],
    );
  }

  listaDinamica() {
    listaDeAtributos =
        Provider.of<ControleNivel01>(context).listaDeAtributosEscolhidos;

    if (this.listaDeAtributos.length > 0) {
      return ListView.builder(
        itemCount: listaDeAtributos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: stackBehindDismiss(),
            key: Key(listaDeAtributos[index]),
            onDismissed: (direction) {
              deleteItemAtributo(index);
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 8,
              ),
              margin: EdgeInsets.symmetric(vertical: 1),
              width: this.screnSize,
              height: 35,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: this.screnSize - 60,
                    child: Text(
                      this.listaDeAtributos[index],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      size: 28,
                    ),
                    onPressed: () => {},
                    padding: EdgeInsets.only(bottom: 2),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void deleteItemAtributo(index) {
    setState(() {
      // this.listaDeAtributos.removeAt(index);
      // debugPrint("Removendo item");
      String atributo = this.listaDeAtributos[index];
      Provider.of<ControleNivel01>(context).removerAtributoEscolhido(atributo);
    });
  }

  widgetListaDeMetodos() {
    this.listaDeMetodos =
        Provider.of<ControleNivel01>(context).listaDeMetodosEscolhidos;
    if (this.listaDeMetodos.length > 0) {
      return ListView.builder(
        itemCount: Provider.of<ControleNivel01>(context)
            .listaDeMetodosEscolhidos
            .length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: stackBehindDismiss(),
            key: Key(listaDeMetodos[index]),
            onDismissed: (direction) {
              deleteItemMetodo(index);
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 8,
              ),
              margin: EdgeInsets.symmetric(vertical: 1),
              width: this.screnSize,
              height: 35,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: this.screnSize - 60,
                    child: Text(
                      this.listaDeMetodos[index],
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      size: 28,
                    ),
                    onPressed: () => {},
                    padding: EdgeInsets.only(bottom: 2),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void deleteItemMetodo(index) {
    setState(() {
      //   this.listaDeMetodos.removeAt(index);
      // debugPrint("Removendo Metodo");
      String metodo = this.listaDeMetodos[index];
      Provider.of<ControleNivel01>(context)
          .removerMetodoEscolhidoPorJogador(metodo);
    });
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
