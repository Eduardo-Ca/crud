import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/repositories/produto_repository.dart';
import 'package:teste/modules/produto/domain/usecases/interfaces/interface_produto_usecase.dart';

class UseCasesProduto extends IUsecasesProduto {
  final IProdutoRepository repositoryRemoto;

  UseCasesProduto(this.repositoryRemoto);

  @override
  Future<List<ProdutoModel>> obterTodosProdutos() async {
    final result = await repositoryRemoto.obterTodosProdutos();

    return result;
  }
}
