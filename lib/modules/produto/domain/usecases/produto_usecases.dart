import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/repositories/produto_repository.dart';
import 'package:teste/modules/produto/domain/usecases/interfaces/interface_produto_usecase.dart';

class UseCasesProduto extends IUsecasesProduto {
  final IProdutoRepository repositoryRemoto;

  UseCasesProduto(this.repositoryRemoto);

  @override
  Future<List<ProdutoModel>> obterTodosProdutos(nome) async {
    final result = await repositoryRemoto.obterTodosProdutos(nome);

    return result;
  }

   @override
  Future<dynamic> criarProduto({ nome,  descricao,precoUnitario,quantidadeEstoque}) async{
   
    final resultado = await repositoryRemoto.criarProduto(nome,descricao,precoUnitario,quantidadeEstoque );
    return resultado;
  }

   @override
  Future<dynamic> editarProduto({ nome,  descricao,precoUnitario,quantidadeEstoque,id}) async{
   
    final resultado = await repositoryRemoto.editarProduto(nome,  descricao,precoUnitario,quantidadeEstoque,id);
    return resultado;
  }
  
  @override
  Future deletarProduto({required int id}) async{
   final resultado = await repositoryRemoto.deletarProduto(id: id);
    return resultado;
  }
}
