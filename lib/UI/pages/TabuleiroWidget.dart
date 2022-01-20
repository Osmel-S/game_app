import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/game/cobras_escadas.dart';
import 'package:game_app/model/campos.dart';
import 'package:game_app/model/tabuleiro.dart';

class TabuleiroWidget extends StatefulWidget {
  @override
  _TabuleiroWidgetState createState() => _TabuleiroWidgetState();
}

class _TabuleiroWidgetState extends State<TabuleiroWidget> {
  Tabuleiro tabuleiro =
      Tabuleiro(linhas: 10, colunas: 10, cobrasEscadas: CobrasEscadas());

  bool iniciarJogo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 252, 186, 5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 252, 186, 5),
        elevation: 0,
        title: iniciarJogo
            ? Text(
                "NÚMERO SORTEADO : ${tabuleiro.cobrasEscadas.dado1 + tabuleiro.cobrasEscadas.dado2}",
                style: TextStyle(
                    color: Color.fromRGBO(255, 127, 55, 5),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                "COBRAS E ESCADAS",
                style: TextStyle(
                    color: Color.fromRGBO(255, 127, 55, 5),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(child: Container()),
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 3.0,
                        color:
                            tabuleiro.validacao2 ? Colors.green : Colors.red),
                  ),
                  child: CircleAvatar(
                      radius: 35,
                      child: Image.asset(
                        'assets/profile_avatar.png',
                      ))),
              SizedBox(
                width: 5,
              ),
              Text(
                "Jogador ${tabuleiro.jogador2.id}: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(tabuleiro.validacao
                  ? tabuleiro.mensagem1
                  : tabuleiro.mensagem2),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Stack(children: [
            Container(
              //color: Colors.grey,
              height: 400,
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                  crossAxisCount: 10,
                  children: tabuleiro.list.map((e) {
                    return GestureDetector(
                      onTap: () {
                        print(
                            "apertou na linha ${e.linha} e colunha ${e.coluna}");
                      },
                      child: Stack(children: [
                        Container(
                          color: Colors.grey,
                          child: Image.asset(e.caminhoImg),
                        ),
                        getContainer(context, e, Colors.black, 1),
                        getContainer(context, e, Colors.red, 2),
                      ]),
                    );
                  }).toList()),
            ),
          ]),
          Row(
            children: [
              Expanded(child: Container()),
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 3.0,
                        color: tabuleiro.validacao ? Colors.green : Colors.red),
                  ),
                  child: CircleAvatar(
                      radius: 35,
                      child: Image.asset(
                        'assets/jpeg1.png',
                      ))),
              SizedBox(
                width: 5,
              ),
              Text(
                "Jogador ${tabuleiro.jogador1.id}: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(tabuleiro.validacao2
                  ? tabuleiro.mensagem1
                  : tabuleiro.mensagem2),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onSurface: Colors.grey,
                      minimumSize: Size(50, 50),
                      primary: Color.fromRGBO(117, 255, 205, 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60))),
                  onPressed: tabuleiro.cobrasEscadas.vencedor
                      ? null
                      : () {
                          setState(() {
                            iniciarJogo = true;

                            if (tabuleiro.alternarJogador) {
                              tabuleiro.cobrasEscadas
                                  .jogar(tabuleiro, tabuleiro.jogador1.id);
                              tabuleiro.cobrasEscadas.dadosIguais()
                                  ? tabuleiro.setAlternarJogador(true)
                                  : tabuleiro.setAlternarJogador(false);
                              tabuleiro.vencedor = tabuleiro.jogador1.id;
                            } else {
                              tabuleiro.cobrasEscadas
                                  .jogar(tabuleiro, tabuleiro.jogador2.id);
                              tabuleiro.cobrasEscadas.dadosIguais()
                                  ? tabuleiro.setAlternarJogador(false)
                                  : tabuleiro.setAlternarJogador(true);
                              tabuleiro.vencedor = tabuleiro.jogador2.id;
                            }
                            if (tabuleiro.cobrasEscadas.vencedor) {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      backgroundColor: Colors.redAccent,
                                      title: Text(
                                        "JOGADOR ${tabuleiro.vencedor} VENCEU !!!!!!!!!",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  });
                            }
                          });
                        },
                  child: Text(iniciarJogo ? "JOGAR DADOS" : " INICIAR JOGO ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onSurface: Colors.redAccent,
                    minimumSize: Size(50, 50),
                    //fixedSize: Size(0, 50),
                    primary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
                onPressed: () {
                  setState(() {
                    tabuleiro.peca1.setLinhaT(0);
                    tabuleiro.peca1.setColunaT(3);
                    tabuleiro.peca2.setLinhaT(0);
                    tabuleiro.peca2.setColunaT(3);
                    tabuleiro.cobrasEscadas.vencedor = false;
                    iniciarJogo = false;
                  });
                },
                child: Text("NOVA PARTIDA", style: TextStyle(fontSize: 15)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getContainer(BuildContext context, Campo e, Color cor, int index) {
    if (e.coluna == tabuleiro.peca1.coluna &&
        e.linha == tabuleiro.peca1.linha &&
        index == 1) {
      return Positioned(
        height: 20,
        width: 20,
        bottom: 1,
        left: 2,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle, color: cor),
          child: Text(
            index.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else if (e.coluna == tabuleiro.peca2.coluna &&
        e.linha == tabuleiro.peca2.linha) {
      return Positioned(
        height: 20,
        width: 20,
        bottom: 15,
        left: 2,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle, color: cor),
          child: Text(index.toString(), style: TextStyle(color: Colors.white)),
        ),
      );
    }
    return Container();
  }
}
