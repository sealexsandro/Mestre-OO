import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class PontosJogador {
  int pontos;
  String loginJogador;
  static var pontosJogadores = new List<PontosJogador>();

  // Construtor ja atribuindo o valor dos parametros aos atributos da classe
  PontosJogador({this.pontos, this.loginJogador});

  PontosJogador.fromJson(Map<String, dynamic> json) {
    pontos = json['pontos'];
    loginJogador = json['loginJogador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pontos'] = this.pontos;
    data['loginJogador'] = this.loginJogador;
    return data;
  }

  static Future salvar(PontosJogador pontoJogador) async {
    print("Pontos mandados: ${pontoJogador.pontos.toString()}");
    print("Email mandados: ${pontoJogador.loginJogador.toString()}");
    if (pontosJogadores.length > 0) {
      print("Entrou 1");
      int cont = 0;
      bool isExiste = false;
      for (var i = 0; i < pontosJogadores.length; i++) {
        cont = i;
        if (pontosJogadores[i].loginJogador == pontoJogador.loginJogador) {
          isExiste = true;
          print("Entrou 2");
          break;
        }
      }
      if (isExiste) {
        pontosJogadores[cont].pontos = pontoJogador.pontos;
        print("Entrou 3");
      } else {
        pontosJogadores.add(
          PontosJogador(
              pontos: pontoJogador.pontos,
              loginJogador: pontoJogador.loginJogador),
        );
        print("Entrou 4");
      }
    } else {
      pontosJogadores.add(
        PontosJogador(
            pontos: pontoJogador.pontos,
            loginJogador: pontoJogador.loginJogador),
      );
      print("Entrou 5");
    }
    // if (pontosJogadores.length > 0) {
    //   PontosJogador pontoJog = pontosJogadores
    //       .firstWhere((test) => test.loginJogador == pontoJogador.loginJogador);
    //   if (pontoJog != null) {
    //     pontoJog.pontos = pontoJogador.pontos;
    //     print("Entrou 1");
    //   } else {
    //     pontosJogadores.add(
    //       PontosJogador(
    //           pontos: pontoJogador.pontos,
    //           loginJogador: pontoJogador.loginJogador),
    //     );
    //     print("Entrou 2");
    //   }
    // } else {
    //   pontosJogadores.add(
    //     PontosJogador(
    //         pontos: pontoJogador.pontos,
    //         loginJogador: pontoJogador.loginJogador),
    //   );
    //   print("lista estava zerada ");
    // }

    // pontosJogadores.where((test) {
    //   if (test.loginJogador == pontoJogador.loginJogador) {
    //     pontosJogadores
    //         .singleWhere(
    //             (test) => test.loginJogador == pontoJogador.loginJogador)
    //         .pontos = pontoJogador.pontos;
    //     print("Entrou 1");
    //   } else {
    //     pontosJogadores.add(
    //       PontosJogador(
    //           pontos: pontoJogador.pontos,
    //           loginJogador: pontoJogador.loginJogador),
    //     );
    //     print("Entrou 2");
    //   }
    // });

    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', convert.json.encode(pontosJogadores));
    print("Entrou 6");
  }

  static Future clear() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("data", "");
  }

  static Future<PontosJogador> load(String loginJogador) async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data.isEmpty) {
      return null;
    }
    Iterable decoded = convert.json.decode(data);
    List<PontosJogador> result =
        decoded.map((x) => PontosJogador.fromJson(x)).toList();
    pontosJogadores = result;
    if (pontosJogadores.length > 0) {
      print("Lista maior que zero no reload");

      // PontosJogador pontoJog = pontosJogadores
      //     .firstWhere((test) => test.loginJogador == loginJogador);
      for (var i = 0; i < pontosJogadores.length; i++) {
        if (pontosJogadores[i].loginJogador == loginJogador) {
          print("Encontrou pontos");
          return pontosJogadores[i];
        }
      }
      print("Não encontrou pontos");
      return null;
    }
    print("Lista NAO È maior que zero no reload");

    return null;
  }
}
