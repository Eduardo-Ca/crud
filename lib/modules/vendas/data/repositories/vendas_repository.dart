import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';

import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/repositories/produto_repository.dart';

class ProdutoRepository implements IProdutoRepository {
  final IProdutoDatasource dataSource;

  ProdutoRepository(
      this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<ProdutoModel>> obterTodosProdutos() async {
    return await dataSource.obterTodosProdutos();
  }
}
