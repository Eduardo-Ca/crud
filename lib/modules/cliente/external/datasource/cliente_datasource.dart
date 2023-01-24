import 'package:flutter/widgets.dart';
import 'package:teste/modules/cliente/data/datasource/cliente_datasource_abst.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';


RequestUtil _request = RequestUtil();

class ClienteDatasource implements IClienteDatasource {
  @override
  Future<List<ClienteModel>> obterTodosClientes() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_CLIENTES, data: null);

    List<ClienteModel> lista = [];

    retorno.data.forEach((i) => lista.add(ClienteModel.fromJson(i)));

    return lista;
  }
}
