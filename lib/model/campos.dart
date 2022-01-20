class Campo {
  final int linha;
  final int coluna;
  final String caminhoImg;

  Campo({required this.linha, required this.coluna, required this.caminhoImg});

  @override
  String toString() {
    return "caminho: $caminhoImg";
  }
}
