import 'package:game_app/game/cobras_escadas.dart';
import 'package:game_app/model/campos.dart';
import 'package:game_app/model/jogador.dart';
import 'package:game_app/model/peca.dart';

class Tabuleiro {
  bool _alternarJogador = false;
  bool _alternarMensagem = false;
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

  bool get alternarJogador {
    return _alternarJogador;
  }

  bool get alternarMensagem {
    return _alternarMensagem;
  }

   String get mensagem1 {
    return _mensagem1;
  }

  String  get mensagem2 {
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
      print("Alternar jogador: $alternarJogador validacao 1 $validacao e validacao2 $validacao2");
    } else {
      _validacao = false;
      _validacao2 = true;
      print("Else: Alternar jogador: $alternarJogador validacao 1 $validacao e validacao2 $validacao2");
    }
  }


  List<Campo> get list {
    return _list;
  }

  bool mostrarCobrasOuEscadas(){
    bool cobra = peca1.movimentoCobras();
    bool escada = peca1.movimentoEscadas();
    if(cobra || escada){
      return true;
    }
    return false;
  }
}
