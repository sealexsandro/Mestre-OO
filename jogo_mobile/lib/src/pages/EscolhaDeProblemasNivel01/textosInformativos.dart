import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextoInformativo {
  final AutoSizeText textLocadora = new AutoSizeText(
    "Uma locadora de veículo é um tipo de empreendimento que aluga "
    "vário(s) tipos de veículos para seus clientes por um "
    "determinado valor. "
    "Tendo isso em mente, monte as classes a seguir:",
    style: TextStyle(
      fontSize: 19,
      color: Colors.black54,
      fontFamily: "Roboto",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
    ),
    minFontSize: 19,
    stepGranularity: 19,
    maxLines: 11,
    textAlign: TextAlign.justify,
  );
  final AutoSizeText textClinicaMedica = new AutoSizeText(
    "Preciso que você crie classes para um sistema de Clinica Médica. "
    "Esse sistema tem por finalidade  realizar cadastros, pesquisas, "
    "atualizações e exclusões de paciente, funcionários e "
    "atendimentos, além de agendar  consultas e dentre várias outras funções.",
    style: TextStyle(
      fontSize: 19,
      color: Colors.black54,
      fontFamily: "Roboto",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
    ),
    minFontSize: 17,
    stepGranularity: 17,
    maxLines: 11,
    textAlign: TextAlign.justify,
  );

//   AutoSizeText(
//   'The text to display',
//   style: TextStyle(fontSize: 20),
//   maxLines: 2,
// )

  final AutoSizeText textPetShop = new AutoSizeText(
    "Preciso que você crie classes para um sistema de Pet Shop. Um Pet Shop é um "
    "tipo de loja especializada em vender animais, geralmente filhotes, destinados a serem animais "
    "de estimação, bem como vender alimentos, acessórios e artigos para entusiastas, "
    "além de oferecer serviços de embelezamento como banho, tosa e perfumaria. ",
    style: TextStyle(
      fontSize: 19,
      color: Colors.black54,
      fontFamily: "Roboto",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.normal,
    ),
    minFontSize: 17,
    stepGranularity: 17,
    maxLines: 11,
    textAlign: TextAlign.justify,
  );
}
