import 'package:flutter/material.dart';
import 'package:jogo_mobile/pages/diagramaDeClassePetShop.dart';
import 'package:jogo_mobile/pages/escolhaDeProblemas_fase1.dart';
import 'package:jogo_mobile/pages/form_cadastro.dart';
import 'package:jogo_mobile/pages/login_page.dart';
import 'package:jogo_mobile/pages/tela_fases_do_Jogo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var rotas = <String, WidgetBuilder>{
    "/": (BuildContext context) => new LoginPage(),
    "/PageformCadastro": (BuildContext context) => new FormCadastro(),
    "/PageFaseDoJogo": (BuildContext context) => new TelaFaseDoJogo(),
    "/PageEscolhaDeProblemasFase1": (BuildContext context) =>
        new EscolhaDeProblemasFase1(),
    "/PageDiagramaDeClassesPetShop": (BuildContext context) =>
        new DiagramaDeClassesPetShop(),
  };

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: rotas,
      initialRoute: "/",
    );
  }
}
