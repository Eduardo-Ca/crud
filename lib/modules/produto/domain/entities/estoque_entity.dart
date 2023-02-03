import 'package:equatable/equatable.dart';

class Estoque extends Equatable {
  int produtoId;
  int fornecedorId;
  int quantidadeItens;
  int totalEstoque;
  String dataEntradaEstoque;
  String produto;
  String fornecedorProduto;

  Estoque(
      {this.produtoId = 0,
      this.fornecedorId = 0,
      this.quantidadeItens = 0,
      this.totalEstoque = 0,
      this.fornecedorProduto = "",
      this.dataEntradaEstoque ="",
      this.produto = ""});

  @override
  List<Object?> get props => [
        produtoId,
        fornecedorId,
        quantidadeItens,
        produto,
        dataEntradaEstoque,
        fornecedorProduto,
        totalEstoque
      ];
}
