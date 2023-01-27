import 'package:teste/modules/fornecedor/data/datasource/fornecedor_datasource_abst.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';

RequestUtil _request = RequestUtil();

class FornecedorDatasource implements IFornecedorDatasource {
  @override
  Future<List<FornecedorModel>> obterTodosFornecedores() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET,
        endpoint: Endpoints.BUSCAR_FORNECEDORES,
        data: null);

    List<FornecedorModel> lista = [];

    retorno.data.forEach((i) => lista.add(FornecedorModel.fromJson(i)));

    return lista;
  }

  @override
  Future<dynamic> criarFornecedor(nome, telefone, endereco) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_FORNECEDOR,
        data: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
        },
        dataParameters: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future<dynamic> editarFornecedor(nome, telefone, endereco, id) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_FORNECEDOR,
        data: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
        },
        dataParameters: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future deletarFornecedor(id) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.DELETE,
        endpoint: Endpoints.DELETAR_FORNECEDOR,
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
