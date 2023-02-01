import 'package:teste/modules/fornecedor/data/datasource/fornecedor_datasource_abst.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';

RequestUtil _request = RequestUtil();

class FornecedorDatasource implements IFornecedorDatasource {
  @override
  Future<List<FornecedorModel>> obterTodosFornecedores(String? nome) async {
    dynamic retorno = await _request.fazRequestNovo(
      method: Request.GET,
      endpoint: Endpoints.BUSCAR_FORNECEDORES,
      data: {
        "nome": nome,
      },
      dataParameters: {
        "nome": nome,
      },
    );

    List<FornecedorModel> lista = [];

    retorno.data.forEach((i) => lista.add(FornecedorModel.fromJson(i)));

    return lista;
  }

  @override
  Future<dynamic> criarFornecedor(nome, telefone, endereco, cnpj) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_FORNECEDOR,
        data: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cnpj": cnpj,
        },
        dataParameters: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cnpj": cnpj,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future<dynamic> editarFornecedor(nome, telefone, endereco, cnpj, id) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_FORNECEDOR,
        data: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cnpj": cnpj,
        },
        dataParameters: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cnpj": cnpj,
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
