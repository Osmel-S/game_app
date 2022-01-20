class Peca {
  String nome;
  int _coluna = 0;
  int _linha = 9;

  Peca(this.nome);

  int get linha {
    return _linha;
  }

  int get coluna {
    return _coluna;
  }

  setLinhaT(int linha) {
    this._linha = linha;
  }

  setColunaT(int coluna) {
    this._coluna = coluna;
  }

  moverPeca() {
    if (linha % 2 == 0) {
      if (coluna < 1) {
        _linha--;
      } else {
        _coluna--;
      }
    } else {
      if (coluna > 8) {
        _linha--;
      } else {
        _coluna++;
      }
    }
  }

  bool movimentoEscadas() {
    if (linha == 9 && coluna == 1) {
      setLinhaT(6);
      setColunaT(2);
    } else if (linha == 9 && coluna == 6) {
      setLinhaT(8);
      setColunaT(6);
    } else if (linha == 9 && coluna == 7) {
      setLinhaT(6);
      setColunaT(9);
    } else if (linha == 8 && coluna == 5) {
      setLinhaT(7);
      setColunaT(5);
    } else if (linha == 7 && coluna == 0) {
      setLinhaT(5);
      setColunaT(1);
    } else if (linha == 7 && coluna == 7) {
      setLinhaT(1);
      setColunaT(3);
    } else if (linha == 6 && coluna == 4) {
      setLinhaT(5);
      setColunaT(3);
    } else if (linha == 4 && coluna == 9) {
      setLinhaT(3);
      setColunaT(6);
    } else if (linha == 2 && coluna == 2) {
      setLinhaT(0);
      setColunaT(2);
    } else if (linha == 2 && coluna == 9) {
      setLinhaT(0);
      setColunaT(9);
    } else if (linha == 1 && coluna == 6) {
      setLinhaT(0);
      setColunaT(6);
    } else {
      return false;
    }

    return true;
  }

  bool movimentoCobras() {
    if (linha == 8 && coluna == 4) {
      setLinhaT(9);
      setColunaT(5);
    } else if (linha == 5 && coluna == 5) {
      setLinhaT(7);
      setColunaT(4);
    } else if (linha == 5 && coluna == 8) {
      setLinhaT(8);
      setColunaT(9);
    } else if (linha == 3 && coluna == 1) {
      setLinhaT(8);
      setColunaT(1);
    } else if (linha == 3 && coluna == 3) {
      setLinhaT(4);
      setColunaT(0);
    } else if (linha == 2 && coluna == 6) {
      setLinhaT(4);
      setColunaT(7);
    } else if (linha == 1 && coluna == 8) {
      setLinhaT(3);
      setColunaT(7);
    } else if (linha == 0 && coluna == 8) {
      setLinhaT(1);
      setColunaT(7);
    } else if (linha == 0 && coluna == 5) {
      setLinhaT(2);
      setColunaT(5);
    } else if (linha == 0 && coluna == 1) {
      setLinhaT(2);
      setColunaT(0);
    } else {
      return false;
    }
    return true;
  }
}
