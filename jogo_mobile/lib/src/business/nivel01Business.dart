import 'package:flutter/widgets.dart';
import 'package:jogo_mobile/src/enums/enumsBusinessNivel01.dart';
import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';
import 'package:jogo_mobile/src/model/servicesFase1.dart';

class Nivel01Business {
  BuildContext context;
  ClasseTemplate classeTemplate;
  TipoDeProblema tipoDeProblema;
  // numero do problema que o jogador está respondendo
  int numeroDoProblema;
  int pontuacaoAtualDoJogador;
  int scoreTotal;
  ServiceNivel01 _servicesNivel01;
  // Atributos que serão escolhidos pelo jogador
  List<String> listaDeAtributosEscolhidos = [];

  // Metodos que serão escolhidos pelo jogador
  List<String> listaDeMetodosEscolhidos = [];

  int pontucaoDaRodada;

  Nivel01Business();

  startServices(TipoDeProblema tipoDeProblema) {
    this.pontucaoDaRodada = 0;
    this.tipoDeProblema = tipoDeProblema;
    this._servicesNivel01 = new ServiceNivel01(tipoDeProblema);
  }

  ClasseTemplate retornaClasseDaRodada() {
    this.classeTemplate = _servicesNivel01.retornaClasseDaRodada();
    return this.classeTemplate;
  }

  listaConteudoDosBotoes(String listaRequerida) {
    if (listaRequerida == "atributosColumn01") {
      return this._servicesNivel01.listaDeButoesAtributosColuna1;
    }
    if (listaRequerida == "atributosColumn02") {
      return this._servicesNivel01.listaDeButoesAtributosColuna2;
    }
    if (listaRequerida == "metodosColumn01") {
      return this._servicesNivel01.listaDeButoesMetodosColuna1;
    }
    if (listaRequerida == "metodosColumn02") {
      return this._servicesNivel01.listaDeButoesMetodosColuna2;
    }
  }

  listaAtributosOuMetodosEscolhidos(String tipoDeLista) {
    if (tipoDeLista == "atributo") {
      return this._servicesNivel01.listaDeAtributosEscolhidos;
    } else {
      return this._servicesNivel01.listaDeMetodosEscolhidos;
    }
  }

  //Validar se o atributo poderá ser adicionado
  addAtributoNaListaDaRodada(String atributo) {
    this.listaDeAtributosEscolhidos =
        this._servicesNivel01.listaDeAtributosEscolhidos;
    if (this.listaDeAtributosEscolhidos.length > 0) {
      bool atributoRepetido = false;
      for (var i = 0; i < this.listaDeAtributosEscolhidos.length; i++) {
        if (this.listaDeAtributosEscolhidos[i] == atributo) {
          atributoRepetido = true;
        }
      }
      if (atributoRepetido == false) {
        this._servicesNivel01.addAtributoNaListaDaRodada(atributo);
        return true;
      } else {
        return false;
      }
    } else {
      this._servicesNivel01.addAtributoNaListaDaRodada(atributo);
      return true;
    }
  }

  // Validar se o método poderá ser adicionado
  addMetodoNaListaDaRodada(String metodo) {
    this.listaDeMetodosEscolhidos =
        this._servicesNivel01.listaDeMetodosEscolhidos;
    if (this.listaDeMetodosEscolhidos.length > 0) {
      if (this.listaDeMetodosEscolhidos.contains(metodo)) {
        return false;
      } else {
        this._servicesNivel01.addMetodoNaListaDaRodada(metodo);
        return true;
      }
    } else {
      this._servicesNivel01.addMetodoNaListaDaRodada(metodo);
      return true;
    }
  }

  removerAtributoOuMetodoEscolhido(String tipoDeItem, String item) {
    return this
        ._servicesNivel01
        .removerAtributoOuMetodoEscolhido(tipoDeItem, item);
  }

  incrementarPontosDaRodada(String tipoDeIncrementacao) {
    if (tipoDeIncrementacao == "atributo") {
      this.pontucaoDaRodada += 5;
      return this.pontucaoDaRodada;
    } else {
      this.pontucaoDaRodada += 7;
      return this.pontucaoDaRodada;
    }
  }

  decrementarPontosDaRodada(String tipoDeDecrementacao) {
    if (tipoDeDecrementacao == "atributo") {
      if (this.pontucaoDaRodada >= 5) {
        this.pontucaoDaRodada = (this.pontucaoDaRodada - 5);
        return this.pontucaoDaRodada;
      }
    } else {
      if (this.pontucaoDaRodada >= 7) {
        this.pontucaoDaRodada = (this.pontucaoDaRodada - 7);
        return this.pontucaoDaRodada;
      }
    }
  }

  validarClasse() {
    EnumsValidacaoDeClasse enumsBusinesAtributos = validarAtributosEscolhidos();
    EnumsValidacaoDeClasse enumsBusinesMetodos = validarMetodosEscolhidos();

    if ((enumsBusinesAtributos == EnumsValidacaoDeClasse.atributoCorreto) &&
        (enumsBusinesMetodos == EnumsValidacaoDeClasse.metodoCorreto)) {
      return EnumsValidacaoDeClasse.atributoEmetodoCorreto;
    } else if ((enumsBusinesAtributos ==
            EnumsValidacaoDeClasse.minimoDeTresAtributos) &&
        (enumsBusinesMetodos == EnumsValidacaoDeClasse.minimoDeDoisMetodos)) {
      return EnumsValidacaoDeClasse.minimoDeAtributoEmetodos;
    } else if ((enumsBusinesAtributos ==
        EnumsValidacaoDeClasse.minimoDeTresAtributos)) {
      return EnumsValidacaoDeClasse.minimoDeTresAtributos;
    } else if ((enumsBusinesMetodos ==
        EnumsValidacaoDeClasse.minimoDeDoisMetodos)) {
      return EnumsValidacaoDeClasse.minimoDeDoisMetodos;
    } else if ((enumsBusinesAtributos ==
            EnumsValidacaoDeClasse.atributoIncorreto) &&
        (enumsBusinesMetodos == EnumsValidacaoDeClasse.metodoIncorreto)) {
      return EnumsValidacaoDeClasse.atributoEmetodoIncorreto;
    } else if (enumsBusinesAtributos ==
        EnumsValidacaoDeClasse.atributoIncorreto) {
      return EnumsValidacaoDeClasse.atributoIncorreto;
    } else if (enumsBusinesMetodos == EnumsValidacaoDeClasse.metodoIncorreto) {
      return EnumsValidacaoDeClasse.metodoIncorreto;
    }
  }

  //Validar atributos escolhidos
  validarAtributosEscolhidos() {
    List<String> listAtributosEscolhidos =
        this._servicesNivel01.listaDeAtributosEscolhidos;
    List<String> listAtributosVerdadeiros =
        this._servicesNivel01.listaDeAtributosVerdadeiros;

    if (listAtributosEscolhidos.length > 2) {
      for (var i = 0; i < listAtributosEscolhidos.length; i++) {
        if (listAtributosVerdadeiros.contains(listAtributosEscolhidos[i]) ==
            false) {
          return EnumsValidacaoDeClasse.atributoIncorreto;
        }
      }
      return EnumsValidacaoDeClasse.atributoCorreto;
    } else {
      return EnumsValidacaoDeClasse.minimoDeTresAtributos;
    }
  }

  //Validar metodos escolhidos
  validarMetodosEscolhidos() {
    List<String> listMetodosEscolhidos =
        this._servicesNivel01.listaDeMetodosEscolhidos;
    List<String> listMetodosVerdadeiros =
        this._servicesNivel01.listaDeMetodosVerdadeiros;

    if (listMetodosEscolhidos.length > 1) {
      for (var i = 0; i < listMetodosEscolhidos.length; i++) {
        if (listMetodosVerdadeiros.contains(listMetodosEscolhidos[i]) ==
            false) {
          return EnumsValidacaoDeClasse.metodoIncorreto;
        }
      }
      return EnumsValidacaoDeClasse.metodoCorreto;
    } else {
      return EnumsValidacaoDeClasse.minimoDeDoisMetodos;
    }
  }
}
