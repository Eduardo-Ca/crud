import 'package:teste/modules/produto/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> obterTodosProdutos();
}
