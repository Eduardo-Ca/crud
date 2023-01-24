import 'dart:convert';


import 'package:teste/modules/vendas/domain/entities/vendas_entity.dart';

class VendasModel extends Vendas {
  VendasModel({
    int? Id,
    int? FuncionarioId,
    int? ClienteId,
    int? QuantidadeItens,
    double? ValorCompra,
  }) : super(
            id: Id ?? 0,
            funcionarioId: FuncionarioId ?? 0,
            clienteId: ClienteId ?? 0,
            quantidadeItens: QuantidadeItens ?? 0,
             valorCompra: ValorCompra ?? 0,
            );

             Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'funcionarioId': funcionarioId,
      'clienteId': clienteId,
      'quantidadeItens': quantidadeItens,
      'ValorCompra': valorCompra,
    };
  }

  factory VendasModel.fromMap(Map<String, dynamic> map) {
    return VendasModel(
      Id: map['id'] as int,
      FuncionarioId: map['funcionarioId'] as int,
      ClienteId: map['clienteId'] as int,
      QuantidadeItens: map['quantidadeItens'] as int,
      ValorCompra: map['ValorCompra'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendasModel.fromJson(String source) => VendasModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
