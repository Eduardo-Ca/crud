// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Pedidos extends Equatable {
  int id;
  String produtoPedido;
  double valorUnidade;
  double valorPedido;
  int quantidadeProduto;
  Pedidos({
    required this.id,
    required this.produtoPedido,
    required this.valorUnidade,
    required this.valorPedido,
    required this.quantidadeProduto,
  });

  @override
  List<Object?> get props =>
      [id, produtoPedido, valorUnidade, quantidadeProduto, valorPedido];
}
