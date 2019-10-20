// import 'package:flutter/material.dart';
// import 'package:jogo_mobile/model/ClasseGenerica.dart';
// import 'package:jogo_mobile/model/atributosDasClasses.dart';
// import 'package:jogo_mobile/pages/fase1_page/atributosBloc.dart';
// import 'package:provider/provider.dart';

// class ButaoCaixaDeDialogo extends StatefulWidget {
//   String textoDoButao;
//   ClasseGenerica classeGenerica;
//   ButaoCaixaDeDialogo(String textoDoButao, ClasseGenerica classeGenerica) {
//     this.textoDoButao = textoDoButao;
//     this.classeGenerica = classeGenerica;
//   }

//   @override
//   _ButaoCaixaDeDialogoState createState() =>
//       _ButaoCaixaDeDialogoState(this.textoDoButao, this.classeGenerica);
// }

// class _ButaoCaixaDeDialogoState extends State<ButaoCaixaDeDialogo> {
//   String textoDoButao;
//   ClasseGenerica classeGenerica;

// //  String nomeDoAtributo;
//   Color corDoContainer = Colors.blueAccent[400];
//   List<AtributoClass> listDeAtributosColuna1 = [];
//   List<AtributoClass> listDeAtributosColuna2 = [];
//   List<AtributoClass> listDeAtributosMisturados = [];

//   TransferirdadosDaClasseBloc bloc;

//   _ButaoCaixaDeDialogoState(
//       String textoDoButao, ClasseGenerica classeGenerica) {
//     this.textoDoButao = textoDoButao;
//     this.classeGenerica = classeGenerica;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     _iniciarListas();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 15),
//       width: MediaQuery.of(context).size.width / 2.5,
//       height: 60,
//       child: RaisedButton(
//         color: Colors.deepOrange,
//         shape:
//             RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
//         child: Padding(
//           padding: EdgeInsets.only(left: 20),
//           child: Text(
//             this.textoDoButao.toUpperCase(),
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.white,
//               // fontFamily: 'Raleway',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         elevation: 6,
//         onPressed: () => caixaDeDialog(),
//       ),
//     );
//   }

//   caixaDeDialog() {
//     final screenSize = MediaQuery.of(context).size;

//     var dialog = showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (_) => Center(
//         child: Container(
//           margin: EdgeInsets.only(
//             left: 15,
//             right: 15,
//           ),
//           width: screenSize.width,
//           height: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(left: 10, top: 10),
//                 child: Text(
//                   "Escolha Atributos".toUpperCase(),
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 10, top: 20),
//                 child: Text(
//                   "Pontos por Atributo correto: 05 pontos",
//                   style: TextStyle(
//                     fontSize: 13,
//                   ),
//                 ),
//               ),
//               inseriAtributos(),
//               Container(
//                 margin: EdgeInsets.only(top: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       child: RaisedButton(
//                         color: Colors.deepOrange,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(10)),
//                         padding: EdgeInsets.only(left: 0),
//                         child: Text(
//                           "Cancelar".toUpperCase(),
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                             // fontFamily: 'Raleway',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(right: 20),
//                       child: RaisedButton(
//                         color: Colors.deepOrange,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(10)),
//                         padding: EdgeInsets.only(left: 0),
//                         child: Text(
//                           "Ok".toUpperCase(),
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                             // fontFamily: 'Raleway',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onPressed: () {
//                           enviarAtributos();
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     return dialog;
//   }

//   inseriAtributos() {
//     debugPrint("Tamanho da lista: " + listDeAtributosColuna1.length.toString());
//     return Container(
//       width: MediaQuery.of(context).size.width / 1.2,
//       margin: EdgeInsets.only(left: 10, top: 5),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.blue),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Column(
//             children: listDeAtributosColuna1.map<Widget>((atributoClass) {
//               return _butao(atributoClass);
//             }).toList(),
//           ),
//           Column(
//             children: listDeAtributosColuna2.map<Widget>((atributoClass) {
//               return _butao(atributoClass);
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   _butao(AtributoClass atributoClass) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2.6,
//       child: FlatButton(
//         color: corDoContainer,
//         shape:
//             RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
//         padding: EdgeInsets.only(left: 0),
//         child: Text(
//           atributoClass.atributoDeClasse,
//           style: TextStyle(
//             fontSize: 13,
//             color: Colors.white,
//             // fontFamily: 'Raleway',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         onPressed: () {
//           _mudarCorDoButao(atributoClass);
//         },
//       ),
//     );
//   }

//   void _iniciarListas() {
//     this.bloc = Provider.of<TransferirdadosDaClasseBloc>(context);
//     listDeAtributosColuna1 = [];
//     listDeAtributosColuna2 = [];
//     List<String> listDeAtributosVariados =
//         this.bloc.transferirListaDeAtributosMisturados(this.classeGenerica);

//     if (listDeAtributosVariados.length > 0) {
//       // listDeAtributosVariados.shuffle();
//       for (var i = 0; i < listDeAtributosVariados.length; i++) {
//         if (i < 4) {
//           //      debugPrint("Valor do atributo: " + listDeAtributosVariados[i]);
//           //Preenchendo com atributos Corretos da classe escolhida
//           listDeAtributosColuna1.add(listDeAtributosVariados[i]);
//         } else {
//           //Preenchendo com atributos Incorretos para classe escolhida
//           listDeAtributosColuna2.add(listDeAtributosVariados[i]);
//         }
//       }
//     } else {
//       debugPrint("Valore Nulos");
//     }
//   }

//   _mudarCorDoButao(AtributoClass atributoClass) {
//     //update with a new color when the user taps button
//     // setState(() {
//     //   corDoContainer = Colors.pink;
//     // });
//     // TransferirdadosDaClasseBloc tranferirAtrib =
//     //     Provider.of<TransferirdadosDaClasseBloc>(context, listen: false);

//     // tranferirAtrib.tranferirAtributo(nomeDoButaoAtributo);

//     if (atributoClass != null) {
//       var existe;
//       for (var i = 0; i < this.listDeAtributosMisturados.length; i++) {
//         if (atributoClass.atributoDeClasse == this.listDeAtributosMisturados[i].atributoDeClasse) {
//           existe = true;
//         }
//       }
//       if (existe != true) {
//         debugPrint("Inseriu-------------------");
//         this.listDeAtributosMisturados.add(atributoClass);
//       }
//     }
//   }

//   enviarAtributos() {
//     if (this.listDeAtributosMisturados.length > 0) {
//       TransferirdadosDaClasseBloc tranferirAtrib =
//           Provider.of<TransferirdadosDaClasseBloc>(context, listen: false);

//       tranferirAtrib.tranferirAtributos(this.listDeAtributosMisturados);
//     }
//   }
// }
