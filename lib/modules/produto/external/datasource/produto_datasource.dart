
import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/produto/data/datasource/produto_datasource_abst.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';

import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';


RequestUtil _request = RequestUtil();

class ProdutoDatasource implements IProdutoDatasource {
  @override
  Future<List<ProdutoModel>> obterTodosProdutos(String? nome) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_PRODUTOS,   data: {
          "nome": nome,
     
        },
        dataParameters: {
          "nome": nome,
        
        },);

    List<ProdutoModel> lista = [];

    retorno.data.forEach((i) => lista.add(ProdutoModel.fromJson(i)));

    return lista;
  }

   @override
  Future<dynamic> criarProduto(
      {String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_PRODUTO,
        data: {
          "nome": nome,
          "descricao": descricao,
          "precoUnitario": precoUnitario,
          "quantidadeEstoque": quantidadeEstoque,
        },
        dataParameters: {
          "nome": nome,
          "descricao": descricao,
          "precoUnitario": precoUnitario,
          "quantidadeEstoque": quantidadeEstoque,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future<dynamic> editarProduto(
      {String? nome, String? descricao, double? precoUnitario, int? quantidadeEstoque,
      int? id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_PRODUTO,
        data: {
          "id": id,
          "nome": nome,
          "descricao": descricao,
          "precoUnitario": precoUnitario,
          "quantidadeEstoque": quantidadeEstoque,
        },
        dataParameters: {
          "id": id,
          "nome": nome,
          "descricao": descricao,
          "precoUnitario": precoUnitario,
          "quantidadeEstoque": quantidadeEstoque,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future deletarProduto({required int id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.DELETE,
        endpoint: Endpoints.DELETAR_PRODUTO,
        data: {
          "id": id,
        },
        dataParameters: {
          "id": id,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }
  
}
