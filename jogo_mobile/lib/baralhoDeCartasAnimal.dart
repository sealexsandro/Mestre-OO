import 'package:flutter/material.dart';

// Classes super
enum EnumsCartaBaseSuper { animal, ave, mamifero, reptil, aracnideo }
// Mamíferos
enum EnumsCartasMamifero { mamifero, cachorro, gato }

// Aves
enum EnumsCartasAve { bem_te_vi, papagaio }

// Aracnideos
enum EnumsCartasAracnideo { aranha }

// Repteis
enum EnumsCartasRepteis { cobra }

//enum EnumsTodasAscartas { cachorro, gato, bem_te_vi, papagaio }

class CartaDoBaralhoAnimal {
  EnumsCartaBaseSuper classeMae;
  final String especieAnimal;
  final String pathDeImagemCorrespondente;
  bool cardFaceVisivel;
  bool cardFoiAberto;

  CartaDoBaralhoAnimal(
      {@required this.classeMae,
      @required this.especieAnimal,
      this.pathDeImagemCorrespondente,
      this.cardFaceVisivel = false,
      this.cardFoiAberto = false});
}

class NomeDaEspecieCartasAnimal {
  NomeDaEspecieCartasAnimal();

  static String getEspecieClasseMamifero(EnumsCartasMamifero cartasMamifero) {
    switch (cartasMamifero) {
      case EnumsCartasMamifero.mamifero:
        return "Mamífero";
      case EnumsCartasMamifero.cachorro:
        return "Cachorro";
      case EnumsCartasMamifero.gato:
        return "Gato";
      default:
        return "Não encontrou Nenhuma Espécie de Mamifero";
    }
  }

  static String getEspecieClasseAve(EnumsCartasAve cartasAve) {
    switch (cartasAve) {
      case EnumsCartasAve.bem_te_vi:
        return "Bem Te Vi";
      case EnumsCartasAve.papagaio:
        return "Papagaio";
      default:
        return "Não encontrou Nenhuma Espécie de Ave";
    }
  }

  static String getEspecieClasseAracnideo(
      EnumsCartasAracnideo cartasAracnideo) {
    switch (cartasAracnideo) {
      case EnumsCartasAracnideo.aranha:
        return "Aranha";

      default:
        return "Não encontrou Nenhuma Espécie da classe Aracnideo";
    }
  }

  static String getEspecieClasseReptil(EnumsCartasRepteis cartasRepteis) {
    switch (cartasRepteis) {
      case EnumsCartasRepteis.cobra:
        return "Cobra";

      default:
        return "Não encontrou Nenhuma Espécie da classe Reptil";
    }
  }
}

// Classe responsavel por dar o endereco de uma imagem para a classe cartaDoBaralhoAnimal
class EnderecoDeImagemDaEspecie {
  static String getEnderecoImagemMamifero(EnumsCartasMamifero cartasMamifero) {
    switch (cartasMamifero) {
      case EnumsCartasMamifero.cachorro:
        return 'assets/images/cao.png';
      case EnumsCartasMamifero.gato:
        return 'assets/images/gato.png';
      default:
        return "Não encontrou Nenhum Endereco de Imagem";
    }
  }

  static String getEnderecoImagemAve(EnumsCartasAve cartasAve) {
    switch (cartasAve) {
      case EnumsCartasAve.bem_te_vi:
        return 'assets/images/bem_te_vi.png';
      case EnumsCartasAve.papagaio:
        return 'assets/images/papagaio.png';
      default:
        return "Não encontrou Nenhum Endereco de Imagem";
    }
  }

  static String getEnderecoImagemAracnideo(
      EnumsCartasAracnideo cartasAracnideo) {
    switch (cartasAracnideo) {
      case EnumsCartasAracnideo.aranha:
        return 'assets/images/aranha.png';
      default:
        return "Não encontrou Nenhum Endereco de Imagem correspondente a classe Aracnideo";
    }
  }

  static String getEnderecoImagemReptil(EnumsCartasRepteis cartasRepteis) {
    switch (cartasRepteis) {
      case EnumsCartasRepteis.cobra:
        return 'assets/images/cobra.png';

      default:
        return "Não encontrou Nenhum Endereco de Imagem correspondente a classe Reptil";
    }
  }
}

class AtributosDaEspecie {
  static String getAtributosMamifero(EnumsCartasMamifero cartasMamifero) {
    switch (cartasMamifero) {
      case EnumsCartasMamifero.mamifero:
        return 'assets/images/cao.png';

      case EnumsCartasMamifero.cachorro:
        return 'assets/images/cao.png';
      case EnumsCartasMamifero.gato:
        return 'assets/images/gato.png';
      default:
        return "Não encontrou Nenhum Endereco de Imagem";
    }
  }

  static String getEnderecoImagemAve(EnumsCartasAve cartasAve) {
    switch (cartasAve) {
      case EnumsCartasAve.bem_te_vi:
        return 'assets/images/bem_te_vi.png';
      case EnumsCartasAve.papagaio:
        return 'assets/images/papagaio.png';
      default:
        return "Não encontrou Nenhum Endereco de Imagem";
    }
  }
}
