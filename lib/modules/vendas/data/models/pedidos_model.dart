import 'dart:convert';

import 'package:teste/modules/vendas/domain/entities/pedidos_entity.dart';

class PedidosModel extends Pedidos {
  PedidosModel({
    int? id,
    String? produtoPedido,
    double? valorUnidade,
    double? valorPedido,
    int? quantidadeProduto,
  }) : super(
          id: id ?? 0,
          produtoPedido: produtoPedido ?? "",
          valorUnidade: valorUnidade ?? 0,
          valorPedido: valorPedido ?? 0,
          quantidadeProduto: quantidadeProduto ?? 0,
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'produtoPedido': produtoPedido,
      'valorUnidade': valorUnidade,
      'valorPedido': valorPedido,
      'quantidadeProduto': quantidadeProduto,
    };
  }

  factory PedidosModel.fromJson(Map<String, dynamic> map) {
    return PedidosModel(
      id: map['id'],
      produtoPedido: map['produtoPedido'] as String,
      valorUnidade: map['valorUnidade'] as double,
      valorPedido: map['valorPedido'] as double,
      quantidadeProduto: map['quantidadeProduto'] as int,
    );
  }
}
