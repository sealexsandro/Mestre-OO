// Enums usados para validar as classes montadas pelo jogador
enum EnumsValidacaoDeClasse {
  minimoDeTresAtributos,
  minimoDeDoisMetodos,
  minimoDeAtributoEmetodos,
  atributoCorreto,
  metodoCorreto,
  atributoIncorreto,
  metodoIncorreto,
  atributoEmetodoCorreto,
  atributoEmetodoIncorreto,
}

enumMsgDeValidacaoDeClasse(EnumsValidacaoDeClasse enumsValidacaoDeClasse) {
  switch (enumsValidacaoDeClasse) {
    case EnumsValidacaoDeClasse.minimoDeAtributoEmetodos:
      return "Você deve escolher no mínimo três atributos e no mínimo dois métodos";
    case EnumsValidacaoDeClasse.minimoDeTresAtributos:
      return "Você deve escolher no mínimo três atributos";
    case EnumsValidacaoDeClasse.minimoDeDoisMetodos:
      return "Você deve escolher no mínimo dois métodos";
    case EnumsValidacaoDeClasse.atributoIncorreto:
      return "Acho que você escolheu algum atributo incorreto";
    case EnumsValidacaoDeClasse.metodoIncorreto:
      return "Acho que você escolheu algum método incorreto";
    case EnumsValidacaoDeClasse.atributoEmetodoIncorreto:
      return "Você escolheu método(s) e atributo(s) incorretos!";
    case EnumsValidacaoDeClasse.atributoEmetodoCorreto:
      return "Você acertou tudo e com isso ganhou ";
    default:
      return "Ops.. houve um problema na validacão classe";
  }
}
