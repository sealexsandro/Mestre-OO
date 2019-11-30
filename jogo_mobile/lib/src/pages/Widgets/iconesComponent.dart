import 'package:flutter/material.dart';

class NomeIcone {
  static final String email = "E-mail";
  static final String nomeDoUser = "Nome do Usuário";
  static final String senha = "Senha";
  static final String repitaASenha = "Repita a Senha";

  // Icones de alerta no jogo
  // Quantidade minima de atributos e metodos
  static final String qntMinimaAtribMet = "qntMinimaAtribMet";
  static final String ganhouRodada = "ganhouRodada";

  static escolhaDeIcone(String nomeDoCampo) {
    if (nomeDoCampo == nomeDoUser) {
      return Icon(
        Icons.person,
        color: Colors.blue,
      );
    }
    if (nomeDoCampo == email) {
      return Icon(
        Icons.email,
        color: Colors.blue,
      );
    }
    if (nomeDoCampo == senha) {
      return Icon(
        Icons.security,
        color: Colors.blue,
      );
    }
    if (nomeDoCampo == repitaASenha) {
      return Icon(
        Icons.security,
        color: Colors.blue,
      );
    }
    if (nomeDoCampo == qntMinimaAtribMet) {
      return Icon(
        Icons.report,
        color: Colors.red,
        size: 35,
      );
    }
    if (nomeDoCampo == ganhouRodada) {
      return Icon(
        Icons.mood,
        color: Colors.green,
        size: 30,
      );
    }
  }
}
