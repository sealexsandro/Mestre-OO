import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/pages/Login/login.dart';
import 'package:jogo_mobile/utils/navegacao.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    splash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: AssetImage('assets/images/img6.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(child: CircularProgressIndicator(),),
    );
  }

  void splash(context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      print("Fim splash");
      pushReplacement(context, Login());
    });
  }
}