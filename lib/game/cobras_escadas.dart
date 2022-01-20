import 'dart:math';
import 'package:game_app/model/tabuleiro.dart';

class CobrasEscadas {
  Random _numeroAleatoio = new Random();
  int _dado1 = 0;
  int _dado2 = 0;
  int numeroSort = 0;
  bool vencedor = false;

  jogar(Tabuleiro tabuleiro, int id) {
    setDado1(1 + _numeroAleatoio.nextInt(6));
    setDado2(1 + _numeroAleatoio.nextInt(6));
    print("Dado 1 : $dado1");
    print("Dado 2 $dado2");
    numeroSort = dado1 + dado2;
    for (int i = 0; i < numeroSort; i++) {
      if (id == 1) {
        tabuleiro.peca1.moverPeca();
      } else if (id == 2) {
        tabuleiro.peca2.moverPeca();
      }
    }
    verificandoMovimentos(tabuleiro, id);
  }

  void verificandoMovimentos(Tabuleiro tabuleiro, int id) {
    if (tabuleiro.peca1.linha == 0 && tabuleiro.peca1.coluna == 0) {
      tabuleiro.peca1.setLinhaT(0);
      tabuleiro.peca1.setLinhaT(0);
      vencedor = true;
    }
    if (tabuleiro.peca2.linha == 0 && tabuleiro.peca2.coluna == 0) {
      tabuleiro.peca2.setLinhaT(0);
      tabuleiro.peca2.setLinhaT(0);
      vencedor = true;
    }
    if (tabuleiro.peca1.linha < 0) {
      if (numeroSort > 11) {
        tabuleiro.peca1.setLinhaT(1);
      } else {
        tabuleiro.peca1.setLinhaT(0);
        tabuleiro.peca1.setColunaT(tabuleiro.peca1.coluna > 8
            ? tabuleiro.peca1.coluna
            : tabuleiro.peca1.coluna + 1);
        print(tabuleiro.peca1.linha);
        print(tabuleiro.peca1.coluna);
      }
    }
    if (tabuleiro.peca2.linha < 0) {
      tabuleiro.peca2.setLinhaT(0);
      tabuleiro.peca2.setColunaT(tabuleiro.peca2.coluna > 8
          ? tabuleiro.peca2.coluna
          : tabuleiro.peca2.coluna + 1);
      print(tabuleiro.peca2.linha);
      print(tabuleiro.peca2.coluna);
    }
    if (id == 1) {
      tabuleiro.peca1.movimentoEscadas();
      print(tabuleiro.peca1.movimentoEscadas());
      tabuleiro.peca1.movimentoCobras();
    } else if (id == 2) {
      tabuleiro.peca2.movimentoEscadas();
      tabuleiro.peca2.movimentoCobras();
    }
  }

  get dado1 {
    return _dado1;
  }

  get dado2 {
    return _dado2;
  }

  void setDado1(int dado1) {
    this._dado1 = dado1;
  }

  bool dadosIguais() {
    return dado1 == dado2;
  }

  void setDado2(int dado2) {
    this._dado2 = dado2;
  }
}
