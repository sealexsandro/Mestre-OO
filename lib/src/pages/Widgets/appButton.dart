import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String textoDoButao;
  Function funcaoDoButao;
  bool showProgress;

  AppButton({
    this.textoDoButao,
    this.funcaoDoButao,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //   margin: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width / 1.2,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6078ea),
            Color(0xFF17ead9),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: FlatButton(
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Center(
                child: Text(
                  textoDoButao.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        onPressed: funcaoDoButao,
      ),
    );
  }
}
