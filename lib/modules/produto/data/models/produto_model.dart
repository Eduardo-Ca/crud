import 'dart:convert';

import 'package:teste/modules/produto/domain/entities/produto_entity.dart';

class ProdutoModel extends Produto {
  ProdutoModel(
      {int? id,
      String? nome,
      String? descricao,
      int? quantidadeEstoque,
      double? precoUnitario})
      : super(
            id: id ?? 0,
            nome: nome ?? "",
            descricao: descricao ?? "",
            quantidadeEstoque: quantidadeEstoque ?? 0,
            precoUnitario: precoUnitario ?? 0);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'quantidadeEstoque': quantidadeEstoque,
      'precoUnitario': precoUnitario
    };
  }

  factory ProdutoModel.fromJson(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      descricao: map['telefone'] as String,
      quantidadeEstoque: map['quantidadeEstoque'] as int,
      precoUnitario: map['precoUnitario'] as double,
    );
  }

  
}
