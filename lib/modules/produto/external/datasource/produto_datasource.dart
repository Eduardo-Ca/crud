
import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';

import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';


RequestUtil _request = RequestUtil();

class ProdutoDatasource implements IProdutoDatasource {
  @override
  Future<List<ProdutoModel>> obterTodosProdutos() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_PRODUTOS, data: null);

    List<ProdutoModel> lista = [];

    retorno.data.forEach((i) => lista.add(ProdutoModel.fromJson(i)));

    return lista;
  }
  
}
