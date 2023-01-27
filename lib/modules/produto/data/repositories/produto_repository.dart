import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/produto/data/datasource/produto_datasource_abst.dart';

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

    @override
  Future<dynamic> criarProduto(
       String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque
       ) async {
    return await dataSource.criarProduto(nome: nome,descricao: descricao,precoUnitario: precoUnitario,quantidadeEstoque: quantidadeEstoque);
  }

  
   @override
  Future<dynamic> editarProduto(
       String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque,
       int? id) async {
    return await dataSource.editarProduto(nome: nome,descricao: descricao,precoUnitario: precoUnitario,quantidadeEstoque: quantidadeEstoque,id: id);
  }

  @override
  Future<dynamic> deletarProduto({required int id}) async {
    return await dataSource.deletarProduto(id:id);
  }
  
 
}
