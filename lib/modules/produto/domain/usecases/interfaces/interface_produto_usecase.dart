


import 'package:teste/modules/produto/data/models/produto_model.dart';

abstract class IUsecasesProduto{
  
  Future<List<ProdutoModel>>
      obterTodosProdutos(); 

  Future<dynamic> criarProduto(
      {String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque});

  Future<dynamic> editarProduto(
      {String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque, int? id});

  Future<dynamic> deletarProduto({required int id});

}
