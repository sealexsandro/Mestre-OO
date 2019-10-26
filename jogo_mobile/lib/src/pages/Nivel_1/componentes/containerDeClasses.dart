import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:provider/provider.dart';

class ContainerDeClasse extends StatefulWidget {
  String nomeDaClasse;
  ControleNivel01 controleNivel01;

  ContainerDeClasse(String nomeDaClasse, ControleNivel01 controleNivel01) {
    this.nomeDaClasse = nomeDaClasse;
    //  this.controleNivel01 = controleNivel01;
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

  _ContainerDeClasseState(String nomeDaClasse) {
    this.nomeDaClasse = nomeDaClasse;
  }

  @override
  void initState() {
    super.initState();
    this.listaDeAtributos = [];
    this.listaDeMetodos = [];
    this.controleNivel01 = Provider.of<ControleNivel01>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    this.screnSize = MediaQuery.of(context).size.width / 1.7;
    return Container(
      width: this.screnSize,
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: this.screnSize,
            height: 30,
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
                ),
              ),
            ),
          ),
          Container(
            width: this.screnSize-2,
            height: 150,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: Colors.blue,
                ),
              ),
            ),
            child: Container(
              child: Scrollbar(
                child: widgetListaDeAtributos(),
              ),
            ),
          ),
          Container(
            width: this.screnSize,
            height: 90,
            child: Container(
              child: Scrollbar(
                child: widgetListaDeMetodos(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  widgetListaDeAtributos() {
    String atributo = Provider.of<ControleNivel01>(context).atributoEscolhido;
    if ((atributo != null) && (atributo != "")) {
      this.listaDeAtributos.add(atributo);
      debugPrint("Lista recebida: ${listaDeAtributos.length}");
      this.controleNivel01.limparStringAtributo();
    }

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
    /*
  Ao implementar esse método, ele garante que, ao ser dispensado da nossa árvore de widgets,
  o item é removido da nossa lista de itens e a lista é atualizada, portanto
  impedindo o erro "Widget dispensado ainda na árvore de widgets" quando recarregamos.
  */
    String atributo = this.listaDeAtributos[index];
    this.controleNivel01.removerAtributoEscolhido(atributo);
    setState(() {
      this.listaDeAtributos.removeAt(index);
      debugPrint("Removendo item");
    });
  }

  widgetListaDeMetodos() {
    String metodo = Provider.of<ControleNivel01>(context).metodoEscolhido;
    if ((metodo != null) && (metodo != "")) {
      this.listaDeMetodos.add(metodo);
      debugPrint("Lista recebida: ${listaDeMetodos.length}");
      this.controleNivel01.limparStringMetodo();
    }

    if (this.listaDeMetodos.length > 0) {
      return ListView.builder(
        itemCount: listaDeMetodos.length,
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
    String metodo = this.listaDeMetodos[index];
    this.controleNivel01.removerMetodoEscolhidoPorJogador(metodo);
    setState(() {
      this.listaDeMetodos.removeAt(index);
      debugPrint("Removendo Metodo");
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
