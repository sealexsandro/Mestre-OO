import 'package:flutter/material.dart';

class NomeIconeComponent {

  static final String email = "E-mail";
  static final String nomeDoUser = "Nome do Usuário";
  static final String senha = "Senha";
  static final String repitaASenha = "Repita a Senha";


  static escolhaDeIcone(String nomeDoCampo) {
    if (nomeDoCampo == nomeDoUser) {
      return Icon(
        Icons.person,
        color: Colors.blue,
      );
    } else if (nomeDoCampo == email) {
      return Icon(
        Icons.email,
        color: Colors.blue,
      );
    } else if (nomeDoCampo == senha) {
      return Icon(
        Icons.security,
        color: Colors.blue,
      );
    } else if (nomeDoCampo == repitaASenha) {
      return Icon(
        Icons.security,
        color: Colors.blue,
      );
    }
  }
}
