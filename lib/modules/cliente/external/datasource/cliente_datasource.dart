import 'dart:convert';

import 'package:teste/modules/cliente/data/datasource/cliente_datasource_abst.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';

RequestUtil _request = RequestUtil();

class ClienteDatasource implements IClienteDatasource {
  @override
  Future<List<ClienteModel>> obterTodosClientes(nome) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_CLIENTES, 
        data: {
          "nome": nome,
        },
        dataParameters: {
          "nome": nome,
          
        },);

    List<ClienteModel> lista = [];

    retorno.data.forEach((i) => lista.add(ClienteModel.fromJson(i)));

    return lista;
  }

  @override
  Future<dynamic> criarCliente(nome, telefone, endereco, cpf) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_CLIENTE,
        data: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cpf": cpf,
        },
        dataParameters: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cpf": cpf,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future<dynamic> editarCliente(nome, telefone, endereco, cpf, id) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_CLIENTE,
        data: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cpf": cpf,
        },
        dataParameters: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cpf": cpf,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future deletarCliente(id) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.DELETE,
        endpoint: Endpoints.DELETAR_CLIENTE,
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
