import 'dart:convert';

import 'package:teste/modules/vendas/domain/entities/vendas_entity.dart';

class VendasModel extends Vendas {
  VendasModel({
    int? id,
    String? clientePedido,
    String? funcionarioPedido,
    String? dataVenda,
    double? valorCompra,
  }) : super(
          id: id ?? 0,
          clientePedido: clientePedido ?? "",
          funcionarioPedido: funcionarioPedido ?? "",
          dataVenda: dataVenda ?? "",
          valorCompra: valorCompra ?? 0,
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'clientePedido': clientePedido,
      'funcionarioPedido': funcionarioPedido,
      'dataVenda': dataVenda,
      'valorCompra': valorCompra,
    };
  }

  factory VendasModel.fromJson(Map<String, dynamic> map) {
    return VendasModel(
      id: map['id'],
      clientePedido: map['clientePedido'] as String,
      funcionarioPedido: map['funcionarioPedido'] as String,
      dataVenda: map['dataVenda'] as String,
      valorCompra: map['valorCompra'],
    );
  }
}
