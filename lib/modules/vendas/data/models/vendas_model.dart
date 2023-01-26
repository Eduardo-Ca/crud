import 'dart:convert';


import 'package:teste/modules/vendas/domain/entities/vendas_entity.dart';

class VendasModel extends Vendas {
  VendasModel({
    int? id,
    int? funcionarioId,
    int? clienteId,
    int? quantidadeItens,
    double? valorCompra,
  }) : super(
            id: id ?? 0,
            funcionarioId: funcionarioId ?? 0,
            clienteId: clienteId ?? 0,
            quantidadeItens: quantidadeItens ?? 0,
             valorCompra: valorCompra ?? 0,
            );

             Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'funcionarioId': funcionarioId,
      'clienteId': clienteId,
      'quantidadeItens': quantidadeItens,
      'ValorCompra': valorCompra,
    };
  }

  factory VendasModel.fromJson(Map<String, dynamic> map) {
    return VendasModel(
      id: map['id'] as int,
      funcionarioId: map['funcionarioId'] as int,
      clienteId: map['clienteId'] as int,
      quantidadeItens: map['quantidadeItens'] as int,
      valorCompra: map['ValorCompra'] as double,
    );
  }

 
}
