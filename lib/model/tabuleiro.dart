import 'package:game_app/game/cobras_escadas.dart';
import 'package:game_app/model/campos.dart';
import 'package:game_app/model/jogador.dart';
import 'package:game_app/model/peca.dart';

class Tabuleiro {
  bool _alternarJogador = false;
  int vencedor = 0;
  String _mensagem1 = 'Aguarde sua vez!';
  String _mensagem2 = 'Jogue os Dados!';
  bool _validacao = false;
  bool _validacao2 = false;
  final int linhas;
  final int colunas;
  List<Campo> _list = [];
  final CobrasEscadas cobrasEscadas;
  Jogador jogador1 = Jogador(id: 1, nome: "JOSÉ");
  Jogador jogador2 = Jogador(id: 2, nome: "joão");
  Peca peca1 = Peca("PECA 1");
  Peca peca2 = Peca("PECA 2");

  Tabuleiro(
      {required this.linhas,
      required this.colunas,
      required this.cobrasEscadas}) {
    inicializarTabuleiro();
  }

  inicializarTabuleiro() {
    int i = 0;
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _list.add(
            Campo(linha: l, coluna: c, caminhoImg: "assets/image${i++}.png"));
      }
    }
  }

  void te() {
    if (alternarJogador) {
      cobrasEscadas.jogar(this, jogador1.id);
      cobrasEscadas.dadosIguais()
          ? setAlternarJogador(true)
          : setAlternarJogador(false);
      vencedor = jogador1.id;
    } else {
      cobrasEscadas.jogar(this, jogador2.id);
      cobrasEscadas.dadosIguais()
          ? setAlternarJogador(false)
          : setAlternarJogador(true);
      vencedor = jogador2.id;
    }
  }

  bool get alternarJogador {
    return _alternarJogador;
  }

  String get mensagem1 {
    return _mensagem1;
  }

  String get mensagem2 {
    return _mensagem2;
  }

  bool get validacao {
    return _validacao;
  }

  bool get validacao2 {
    return _validacao2;
  }

  void setAlternarJogador(bool alternarJogador) {
    this._alternarJogador = alternarJogador;
    if (_alternarJogador) {
      _validacao = true;
      _validacao2 = false;
    } else {
      _validacao = false;
      _validacao2 = true;
    }
  }

  List<Campo> get list {
    return _list;
  }
}
