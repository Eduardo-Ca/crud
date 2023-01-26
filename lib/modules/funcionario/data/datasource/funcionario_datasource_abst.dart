
import 'package:teste/modules/produto/data/models/produto_model.dart';


abstract class IProdutoDatasource {
  Future<List<ProdutoModel>> obterTodosProdutos();
}
