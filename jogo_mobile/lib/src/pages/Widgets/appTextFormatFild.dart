import 'package:flutter/material.dart';
import 'package:jogo_mobile/src/pages/Widgets/iconesComponent.dart';

class AppTextFormatField extends StatelessWidget {
  String nomeDoCampo;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  double larguraDoContainer;

  AppTextFormatField(
      {this.nomeDoCampo,
      this.password = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.larguraDoContainer = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: larguraDoContainer,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
        // bottom: 4,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
            )
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: password,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: (String text) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: NomeIconeComponent.escolhaDeIcone(nomeDoCampo),
          hintText: nomeDoCampo,
          hintStyle: TextStyle(
            fontSize: 18,
          ),
          errorStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
