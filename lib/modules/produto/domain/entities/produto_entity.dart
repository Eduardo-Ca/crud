
import 'package:equatable/equatable.dart';

class Produto extends Equatable {
  int id;
  String nome;
  String descricao;
  double precoUnitario;
  int quantidadeEstoque;
  int quantidade;

  Produto(
      {this.id = 1, this.nome = "", this.descricao = "", this.precoUnitario = 0,this.quantidadeEstoque = 0,this.quantidade = 0,});

  @override
  List<Object?> get props => [id, nome, descricao, precoUnitario,quantidadeEstoque];
}
