import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/controller/controle_nivel_1.dart';
import 'package:jogo_mobile/src/pages/EscolhaDeNivel/escolha_nivel.dart';
import 'package:jogo_mobile/src/pages/Login/login.dart';
import 'package:jogo_mobile/src/pages/Nivel_1/nivel_1.dart';
import 'package:jogo_mobile/src/pages/SignUP/sign_up.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var rotas = <String, WidgetBuilder>{
    "/": (BuildContext context) => new Login(),
    "/SignUp": (BuildContext context) => new SignUp(),
    "/EscolhaDeNivel": (BuildContext context) => new EscolhaDeNivel(),
    "/Nivel01": (BuildContext context) => new Nivel01(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ControleNivel01>(
          builder: (context) => ControleNivel01(),
        ),
      ],
      child: buildMaterialApp(),
    );
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white),
      routes: rotas,
      initialRoute: "/",
    );
  }
}
