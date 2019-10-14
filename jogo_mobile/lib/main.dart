import 'package:flutter/material.dart';
import 'package:jogo_mobile/pages/cadastroDeUser_page/form_cadastro.dart';
import 'package:jogo_mobile/pages/escolhaDeFase_page/tela_fases_do_Jogo.dart';
import 'package:jogo_mobile/pages/fase1_page/atributosBloc.dart';
import 'package:jogo_mobile/pages/fase1_page/telaFase1diagramaDeClasse.dart';
import 'package:jogo_mobile/pages/login_page/login_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var rotas = <String, WidgetBuilder>{
    "/": (BuildContext context) => new LoginPage(),
    "/PageformCadastro": (BuildContext context) => new FormCadastro(),
    "/PageFaseDoJogo": (BuildContext context) => new TelaFaseDoJogo(),
    // "/PageEscolhaDeProblemasFase1": (BuildContext context) =>
    //     new EscolhaDeProblemasFase1(),
    "/Page_Fase1": (BuildContext context) =>
        new Fase1_Classes(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TransferirdadosDaClasseBloc>(
          builder: (context) => TransferirdadosDaClasseBloc(),
        ),
      ],
      child: buildMaterialApp(),
    );
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
