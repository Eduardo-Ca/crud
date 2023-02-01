import 'dart:convert';

import 'package:teste/modules/vendas/domain/entities/pedidos_entity.dart';


class PedidosModel extends Pedidos {
  PedidosModel({
    int? id,
    int? vendaId,
    int? produtoId,
    int? quantidadeItens,
  }) : super(
          id: id ?? 0,
          vendaId: vendaId ?? 0,
          produtoId: produtoId ?? 0,
          quantidadeItens: quantidadeItens ?? 0,
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'vendaId': vendaId,
      'produtoId': produtoId,
      'quantidadeItens': quantidadeItens,
    };
  }

  factory PedidosModel.fromJson(Map<String, dynamic> map) {
    return PedidosModel(
      id: map['id'],
      vendaId: map['vendaId'] as int,
      produtoId: map['produtoId'] as int,
      quantidadeItens: map['quantidadeItens'] as int,
    );
  }
}
