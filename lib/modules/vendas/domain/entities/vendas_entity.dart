// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

class Vendas extends Equatable {
  int id;
  int funcionarioId;
  int clienteId;
  int quantidadeItens;
  double valorCompra;
  Vendas({
    required this.id,
    required this.funcionarioId,
    required this.clienteId,
    required this.quantidadeItens,
    required this.valorCompra,
  });

  

  @override
  List<Object?> get props => [id, funcionarioId, clienteId, quantidadeItens,valorCompra];

 
}
