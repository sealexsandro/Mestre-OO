import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:provider/provider.dart';

class ContainerDeClasse extends StatefulWidget {
  String nomeDaClasse;
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
  List<String> listaDeAtributos = [];
  var screnSize;

  _ContainerDeClasseState(String nomeDaClasse) {
    this.nomeDaClasse = nomeDaClasse;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.controleNivel01 = Provider.of<ControleNivel01>(context);
    this.listaDeAtributos = [];
  }

  @override
  Widget build(BuildContext context) {
    this.screnSize = MediaQuery.of(context).size.width / 2.1;
    return Container(
      width: this.screnSize,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: this.screnSize,
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
              // child: Text(nomeDaClasse.toUpperCase()),
              child: Text("Mamassi mamassá"),
            ),
          ),
          Container(
            width: this.screnSize,
            height: 130,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                ),
              ),
            ),
            child: Container(
              child: Scrollbar(
                child: widgetListaDeAtributos2(),
              ),
            ),
          ),
          Container(
            width: this.screnSize,
          ),
        ],
      ),
    );
  }

  // widgetListaDeAtributos4() {
  //   String atrib = this.controleNivel01.atributo;

  //   if (atrib != null) {
  //     listaDeAtributos.add(atrib);
  //     this.controleNivel01.anularAtributo();

  //     return ListView(
  //       children: ListTile.divideTiles(
  //         context: context,
  //         tiles: listaDeAtributos.map((atributo) {
  //           return Stack(
  //             children: <Widget>[
  //               ListTile(
  //                 title: new Row(
  //                   children: <Widget>[
  //                     new Container(child: new Text(atributo)),
  //                     IconButton(
  //                       icon: new Icon(Icons.delete),
  //                       onPressed: () {
  //                         //  setState(() {
  //                         removerLinhaDeAtributo(atributo);
  //                         // });
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           );
  //         }),
  //       ).toList(),
  //     );
  //   }
  // }

  // widgetListaDeAtributos3() {
  //   String atrib = this.controleNivel01.atributo;

  //   if (atrib != null) {
  //     listaDeAtributos.add(atrib);
  //     this.controleNivel01.anularAtributo();

  //     return ListView(
  //       padding: EdgeInsets.all(10.0),
  //       children: listaDeAtributos.reversed.map((data) {
  //         return Dismissible(
  //           background: stackBehindDismiss(),
  //           key: Key(data),
  //           child: Container(
  //             //  padding: EdgeInsets.all(2),
  //             child: new Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 Container(
  //                   width: this.screnSize - 10,
  //                   margin: EdgeInsets.all(3),
  //                   decoration: BoxDecoration(
  //                     border: Border.all(color: Colors.grey),
  //                     borderRadius: BorderRadius.all(
  //                       Radius.circular(5),
  //                     ),
  //                   ),
  //                   child: Text(
  //                     data,
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           onDismissed: (direction) {
  //             //To delete
  //             deleteItem(data);
  //           },
  //         );
  //       }).toList(),
  //     );
  //   }
  // }

  widgetListaDeAtributos2() {
    listaDeAtributos = this.controleNivel01.listaDeClassesAtributos;

    if (listaDeAtributos.length > 0) {
      return ListView.builder(
        itemCount: listaDeAtributos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: stackBehindDismiss(),
            key: Key(listaDeAtributos[index]),
            //           key: Key(UniqueKey().toString()),
            onDismissed: (direction) {
              //To delete

              //    removerLinhaDeAtributo(listaDeAtributos[index]);
              setState(() {
                //  deleteItem(index);
                this.listaDeAtributos.removeAt(index);
              });
            },
            child: Text(listaDeAtributos[index]),
            // Container(
            //   //  padding: EdgeInsets.all(2),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //       Container(
            //         width: this.screnSize - 10,
            //         margin: EdgeInsets.all(3),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey),
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(5),
            //           ),
            //         ),
            //         child: Text(
            //           listaDeAtributos[index],
            //           style: TextStyle(
            //             fontSize: 14,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          );
        },
      );
    }
  }

  void deleteItem(index) {
    /*
  Ao implementar esse método, ele garante que, ao ser dispensado da nossa árvore de widgets,
  o item é removido da nossa lista de itens e nossa lista é atualizada, portanto
  impedindo o erro "Widget dispensado ainda na árvore de widgets" quando recarregamos.
  */
    //   setState(() {
    if (index > 0) {
      listaDeAtributos.removeAt(index);
    }
//    });
    // listaDeAtributos.removeAt(index);
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

  // widgetListaDeAtributos() {
  //   String atrib = this.controleNivel01.atributo;

  //   if (atrib != null) {
  //     listaDeAtributos.add(atrib);
  //     this.controleNivel01.anularAtributo();

  //     return ListView.builder(
  //       itemCount: 1,
  //       itemBuilder: (BuildContext context, int index) {
  //         debugPrint("Printando ............");
  //         return Column(
  //           children: listaDeAtributos.map(
  //             (atributo) {
  //               debugPrint("Printando 222 ............");
  //               return Row(
  //                 children: <Widget>[
  //                   Container(
  //                     width: this.screnSize - 10,
  //                     margin: EdgeInsets.all(3),
  //                     decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.grey),
  //                       borderRadius: BorderRadius.all(
  //                         Radius.circular(7),
  //                       ),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: <Widget>[
  //                         Container(
  //                           margin: EdgeInsets.only(left: 3),
  //                           width: MediaQuery.of(context).size.width / 3.1,
  //                           child: Text(
  //                             atributo,
  //                             style: TextStyle(
  //                               fontSize: 14,
  //                             ),
  //                           ),
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.only(left: 2),
  //                           child: GestureDetector(
  //                             onTap: () {
  //                               removerLinhaDeAtributo(atributo);
  //                               // setState(() {
  //                               //    removerLinhaDeAtributo(atributo);
  //                               // });
  //                             },
  //                             child: Align(
  //                               alignment: Alignment.topRight,
  //                               child: CircleAvatar(
  //                                 radius: 14.0,
  //                                 backgroundColor: Colors.white,
  //                                 child: Icon(Icons.close, color: Colors.red),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             },
  //           ).toList(),
  //         );
  //       },
  //     );
  //   }
  // }

//   linhaDeAtributo() {
//     String atrib = this.controleNivel01.atributo;

//     if (atrib != null) {
//       listaDeAtributos.add(atrib);
//       this.controleNivel01.anularAtributo();
//       return ListView(
//         // crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: listaDeAtributos.map(
//           (atributo) {
//             //return Text(card);
//             return Row(
//               children: <Widget>[
//                 Container(
//                   width: this.screnSize - 10,
//                   margin: EdgeInsets.all(3),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(7),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Container(
//                         margin: EdgeInsets.only(left: 3),
//                         width: MediaQuery.of(context).size.width / 3.1,
//                         child: Text(
//                           atributo,
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 2),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               removerLinhaDeAtributo(atributo);
//                             });
//                           },
//                           child: Align(
//                             alignment: Alignment.topRight,
//                             child: CircleAvatar(
//                               radius: 14.0,
//                               backgroundColor: Colors.white,
//                               child: Icon(Icons.close, color: Colors.red),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ).toList(),
//       );
//     }
//   }

//   removerLinhaDeAtributo(String atributo) {
//     if (atributo != null) {
//       if (listaDeAtributos.length > 0) {
//         //    setState(() {
//         listaDeAtributos.removeWhere((item) => item == atributo);
//         //  });
//       }
//     }
//   }
}
