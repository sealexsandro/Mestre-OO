import 'package:jogo_mobile/src/enums/enumsItensDeClasse.dart';
import 'package:jogo_mobile/src/model/ClasseTemplate.dart';
import 'package:jogo_mobile/src/model/atributosDasClasses.dart';
import 'package:jogo_mobile/src/model/metodosDasClasses.dart';

class ServiceNivel01 {
  Map mapEnumNomesDeClasses; // Mapa que terá os nomes das classes para o tipo de problema escolhido
  ItensDaClasseGenerica itensDaClasseGenerica;
  List<String>
      listaDeMetodosEscolhidos; // Metodos que serão escolhidos pelo jogador
  List<String>
      listaDeAtributosEscolhidos; // Atributos que serão escolhidos pelo jogador
  List<String>
      listaDeButoesAtributosColuna1; // Atributos da coluna 1 da caixa de Dialog
  List<String>
      listaDeButoesAtributosColuna2; // Atributos  da coluna 2 da caixa de Dialog
  List<String>
      listaDeButoesMetodosColuna1; // Metodos da coluna 1 da caixa de Dialog
  List<String>
      listaDeButoesMetodosColuna2; // Metodos da coluna 2 da caixa de Dialog
  List<String> listaDeAtributosVerdadeiros; // Lista de Atributos Verdadeiros
  List<String> listaDeMetodosVerdadeiros; // Lista de Medotos Verdadeiros
  EnumsNomesDeClasses
      enumsNomesDeClasses; //Enum com o nome da classe escolhida para a rodada;
  TipoDeProblema tipoDeProblema;

  ServiceNivel01(TipoDeProblema tipoDeProblema) {
    this.tipoDeProblema = tipoDeProblema;
    iniciarLista();
  }
  // ServiceNivel01._();

  // static ServiceNivel01 unicaInstanciaServiceNivel01;

  // static ServiceNivel01 getUnicaInstanciaServiceNivel01() {
  //   if (unicaInstanciaServiceNivel01 == null)
  //     unicaInstanciaServiceNivel01 = new ServiceNivel01._();
  //   return unicaInstanciaServiceNivel01;
  // }

  iniciarLista() {
    this.listaDeMetodosEscolhidos = [];
    this.listaDeAtributosEscolhidos = [];
    this.listaDeButoesAtributosColuna1 = [];
    this.listaDeButoesAtributosColuna2 = [];
    this.listaDeButoesMetodosColuna1 = [];
    this.listaDeButoesMetodosColuna2 = [];
    this.listaDeAtributosVerdadeiros = [];
    this.listaDeMetodosVerdadeiros = [];
    this.mapEnumNomesDeClasses = new Map();
    this.itensDaClasseGenerica = ItensDaClasseGenerica();
    this.mapEnumNomesDeClasses =
        this.itensDaClasseGenerica.getListaDeNomesDeClasses(tipoDeProblema);
  }

  // Adicionar Atributo na lista de atributos escolhidos na rodada do jogo
  addAtributoNaListaDaRodada(String atributo) {
    //  debugPrint("Atributo adicionado: ${atributo.toString()}");
    this.listaDeAtributosEscolhidos.add(atributo);
  }

  // Adicionar Metodo na lista de atributos escolhidos na rodada do jogo
  addMetodoNaListaDaRodada(String metodo) {
    this.listaDeMetodosEscolhidos.add(metodo);
  }

  removerAtributoOuMetodoEscolhido(String tipoDeItem, String item) {
    if (tipoDeItem == "atributo") {
      if (this.listaDeAtributosEscolhidos.length > 0) {
        this.listaDeAtributosEscolhidos.removeWhere((itemRemocao) => itemRemocao == item);
        return true;
      }
    }
    if (tipoDeItem == "metodo") {
      if (this.listaDeMetodosEscolhidos.length > 0) {
        this.listaDeMetodosEscolhidos.removeWhere((itemRemocao) => itemRemocao == item);
        return true;
      }
    }
    return false;
  }

  retornaClasseDaRodada() {
    if (this.listaDeAtributosEscolhidos.length > 0) {
      limparListas();
    }
    if (this.mapEnumNomesDeClasses.length > 0) {
      var nomeDaClasse = this.mapEnumNomesDeClasses.values.first;
      EnumsNomesDeClasses enumsNomesDeClasses =
          this.mapEnumNomesDeClasses.keys.first;
      this.mapEnumNomesDeClasses.remove(enumsNomesDeClasses);
      // debugPrint(
      //     "Tamnaho da lista depois de remover 2: ${mapEnumNomesDeClasses.length.toString()}");

      //Pegando o nome do Sistema abaixo
      var nomeDoSistema =
          this.itensDaClasseGenerica.getNomeDoSistema(this.tipoDeProblema);

      buscarAtributosMetodosDaClasse(enumsNomesDeClasses);

      ClasseTemplate classeTemplate = new ClasseTemplate(
        nomeDaClasse: nomeDaClasse,
        nomeDoProblema: nomeDoSistema,
      );

      return classeTemplate;
    } else {
      print("NULLLLLLLLLLLLLLLLLLO ");
      return null;
    }
  }

  buscarAtributosMetodosDaClasse(EnumsNomesDeClasses nomeDaClasse) {
    //Buscando atributos verdadeiros e falsos
    this.listaDeAtributosVerdadeiros =
        AtributosDeClasseCorretos.getAtributosCorretos(nomeDaClasse);
    List<String> listaDeAtributosFalsos =
        AtributosDeClasseIncorretos.getAtributosIncorretos(nomeDaClasse);

    listaDeAtributosVerdadeiros.shuffle();
    listaDeAtributosFalsos.shuffle();
    List<String> listaDeAtributosMisturados =
        listaMisturada(listaDeAtributosVerdadeiros, listaDeAtributosFalsos);
    // Preenchendo as colunas com atributos
    preenchendoListasColunasAtributos(listaDeAtributosMisturados);
    //Buscando métodos verdadeiros e falsos
    this.listaDeMetodosVerdadeiros =
        MetodosDeClasseCorretos.getMetodosCorretos(nomeDaClasse);
    List<String> listaDeMetodosFalsos =
        MetodosDeClasseIncorretos.getMetodosIncorretos(nomeDaClasse);
    listaDeMetodosVerdadeiros.shuffle();
    listaDeMetodosFalsos.shuffle();
    List<String> listaDeMetodosMisturados =
        listaMisturada(listaDeMetodosVerdadeiros, listaDeMetodosFalsos);
    // Preenchendo as colunas com metodos
    preenchendoListasColunasMetodos(listaDeMetodosMisturados);
  }

  List<String> listaMisturada(
      List<String> listaVerdadeira, List<String> listaFalsa) {
    List<String> listaMisturada = [];

    if (listaVerdadeira.length > 0 && listaFalsa.length > 0) {
      int cont = 0;
      for (var i = 0; i < 8; i++) {
        if (i < 4 && listaVerdadeira.length > i) {
          //Preenchendo com atributos Corretos da classe escolhida
          listaMisturada.add(listaVerdadeira[i]);
        } else if (i >= 4 && listaFalsa.length > cont) {
          //Preenchendo com atributos Incorretos para classe escolhida
          listaMisturada.add(listaFalsa[cont]);
          cont++;
        }
      }
    }
    return listaMisturada;
  }

  void preenchendoListasColunasAtributos(List<String> listaDeButoesMisturados) {
    listaDeButoesMisturados.shuffle();
    if (listaDeButoesMisturados.length > 0) {
      for (var i = 0; i < listaDeButoesMisturados.length; i++) {
        if (i < 4) {
          //Preenchendo com atributos
          this.listaDeButoesAtributosColuna1.add(listaDeButoesMisturados[i]);
        } else {
          //Preenchendo com atributos
          this.listaDeButoesAtributosColuna2.add(listaDeButoesMisturados[i]);
        }
      }
    } else {
      print("Valores não Inseridos");
    }
  }

  preenchendoListasColunasMetodos(List<String> listaDeButoesMisturados) {
    listaDeButoesMisturados.shuffle();
    if (listaDeButoesMisturados.length > 0) {
      for (var i = 0; i < listaDeButoesMisturados.length; i++) {
        if (i < 4) {
          //Preenchendo com métodos
          this.listaDeButoesMetodosColuna1.add(listaDeButoesMisturados[i]);
        } else {
          //Preenchendo com  metodos
          this.listaDeButoesMetodosColuna2.add(listaDeButoesMisturados[i]);
        }
      }
    } else {
      //  debugPrint("Valores não Inseridos");
    }
  }

//Usuario acertou todos os atributos e metodos
  limparListas() {
    this.listaDeAtributosEscolhidos.clear();
    this.listaDeAtributosVerdadeiros.clear();
    this.listaDeMetodosEscolhidos.clear();
    this.listaDeMetodosVerdadeiros.clear();
    this.listaDeButoesAtributosColuna1.clear();
    this.listaDeButoesAtributosColuna2.clear();
    this.listaDeButoesMetodosColuna1.clear();
    this.listaDeButoesMetodosColuna2.clear();
  }
}
