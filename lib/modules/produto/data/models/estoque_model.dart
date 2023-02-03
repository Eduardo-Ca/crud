import 'dart:convert';

import 'package:teste/modules/produto/domain/entities/estoque_entity.dart';
import 'package:teste/modules/produto/domain/entities/produto_entity.dart';

class EstoqueModel extends Estoque {
  EstoqueModel({
    int? produtoId,
    int? fornecedorId,
    int? quantidadeItens,
    int? totalEstoque,
    String? dataEntradaEstoque,
    String? produto,
    String? fornecedorProduto,
  }) : super(
          produtoId: produtoId ?? 0,
          fornecedorId: fornecedorId ?? 0,
          quantidadeItens: quantidadeItens ?? 0,
          totalEstoque: totalEstoque ?? 0,
          produto: produto ?? "",
          dataEntradaEstoque: dataEntradaEstoque ?? "",
          fornecedorProduto: fornecedorProduto ?? "",
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'produtoId': produtoId,
      'fornecedorId': fornecedorId,
      'quantidadeItens': quantidadeItens,
      'totalEstoque': totalEstoque,
      'produto': produto,
      'dataEntradaEstoque': dataEntradaEstoque,
      'fornecedorProduto': fornecedorProduto,
    };
  }

  factory EstoqueModel.fromJson(Map<String, dynamic> map) {
    return EstoqueModel(
      produtoId: map['produtoId'] != null ? map['produtoId'] as int : 0,
      fornecedorId:   map['fornecedorId'] != null ? map['fornecedorId'] as int:0,
      quantidadeItens:  map['quantidadeItens'] != null ? map['quantidadeItens'] as int:0,
      totalEstoque:  map['totalEstoque'] != null ? map['totalEstoque'] as int:0,
      produto: map['produto']   != null ? map['produto'] as String:"",
      dataEntradaEstoque:map['dataEntradaEstoque']  != null ? map['dataEntradaEstoque'] as String:"",
      fornecedorProduto:map['fornecedorProduto'] != null ? map['fornecedorProduto'] as String:"",
    );
  }
}
