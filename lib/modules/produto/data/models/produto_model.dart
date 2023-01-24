import 'dart:convert';

import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';
import 'package:teste/modules/produto/domain/entities/produto_entity.dart';

class ProdutoModel extends Produto {
  ProdutoModel(
      {int? Id,
      String? Nome,
      String? Descricao,
      int? QuantidadeEstoque,
      double? PrecoUnitario})
      : super(
            id: Id ?? 0,
            nome: Nome ?? "",
            descricao: Descricao ?? "",
            quantidadeEstoque: QuantidadeEstoque ?? 0,
            precoUnitario: PrecoUnitario ?? 0);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': id,
      'Nome': nome,
      'Descricao': descricao,
      'QuantidadeEstoque': quantidadeEstoque,
      'PrecoUnitario': precoUnitario
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      Id: map['Id'] as int,
      Nome: map['nome'] as String,
      Descricao: map['telefone'] as String,
      QuantidadeEstoque: map['QuantidadeEstoque'] as int,
      PrecoUnitario: map['PrecoUnitario'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
