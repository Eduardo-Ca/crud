import 'package:teste/modules/vendas/data/datasource/vendas_datasource_abst.dart';
import 'package:teste/modules/vendas/data/models/pedidos_model.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/store/vendas_store.dart';
import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';

RequestUtil _request = RequestUtil();

class VendasDatasource implements IVendasDatasource {
 
  @override
  Future<List<VendasModel>> obterTodasVendas() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_VENDAS, data: null);

    List<VendasModel> lista = [];

    retorno.data.forEach((i) => lista.add(VendasModel.fromJson(i)));

    return lista;
  }

  @override
  Future<List<VendasModel>> obterVendaPorDia(dias) async {
    dynamic retorno = await _request.fazRequestNovo(
      method: Request.GET,
      endpoint: Endpoints.BUSCAR_VENDAS_POR_DIA,
      data: {
        "dias": dias,
      },
      dataParameters: {
        "dias": dias,
      },
    );

    List<VendasModel> lista = [];

    retorno.data.forEach((i) => lista.add(VendasModel.fromJson(i)));

    return lista;
  }

  @override
  Future<dynamic> criarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_VENDAS,
        data: {
          "funcionarioId": funcionarioId,
          "clienteId": clienteId,
          "valorCompra": valorCompra,
        },
        dataParameters: {
          "funcionarioId": funcionarioId,
          "clienteId": clienteId,
          "valorCompra": valorCompra,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future<dynamic> editarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra, int? id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_VENDAS,
        data: {
          "funcionarioId": funcionarioId,
          "clienteId": clienteId,
          "valorCompra": valorCompra,
        },
        dataParameters: {
          "funcionarioId": funcionarioId,
          "clienteId": clienteId,
          "valorCompra": valorCompra,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future deletarVendas({required int id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.DELETE,
        endpoint: Endpoints.DELETAR_VENDAS,
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

  @override
  Future<List<PedidosModel>> obterTodosPedidos({required int vendaId}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_PEDIDOS,  data: {
          "idVenda": vendaId,
        },
        dataParameters: {
          "idVenda": vendaId,
        },);

    List<PedidosModel> lista = [];

    retorno.data.forEach((i) => lista.add(PedidosModel.fromJson(i)));
 
    return lista;
  }

  @override
  Future<dynamic> criarPedidos(
      {int? vendaId, int? produtoId, int? quantidadeItens}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_PEDIDOS,
        data: {
          "vendaId": vendaId,
          "produtoId": produtoId,
          "quantidadeItens": quantidadeItens,
        },
        dataParameters: {
          "vendaId": vendaId,
          "produtoId": produtoId,
          "quantidadeItens": quantidadeItens,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future deletarPedidos({required int id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.DELETE,
        endpoint: Endpoints.DELETAR_PEDIDOS,
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
