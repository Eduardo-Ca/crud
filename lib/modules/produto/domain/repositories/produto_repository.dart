import 'package:teste/modules/produto/data/models/estoque_model.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> obterTodosProdutos(String? nome);

    Future<dynamic> criarProduto(
    String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque
  );

  Future<dynamic> editarProduto(
     String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque, int? id);

  Future<dynamic> deletarProduto({required int id});

   Future<List<EstoqueModel>>
      obterEstoque(int? dias); 

   Future<dynamic> criarEstoque(
      {int? produtoId, int? fornecedorId, int? quantidadeItens});
}
