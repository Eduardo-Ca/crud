import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/produto/data/datasource/produto_datasource_abst.dart';

import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';

RequestUtil _request = RequestUtil();

class FuncionarioDatasource implements IFuncionarioDatasource {
  @override
  Future<List<FuncionarioModel>> obterTodosFuncionarios(String? nome) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET,
        endpoint: Endpoints.BUSCAR_FUNCIONARIOS,
         data: {
          "nome": nome,
        },
        dataParameters: {
          "nome": nome,
        
        },);

    List<FuncionarioModel> lista = [];

    retorno.data.forEach((i) => lista.add(FuncionarioModel.fromJson(i)));

    return lista;
  }

   @override
  Future<List<CargoModel>> obterTodosCargos() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET,
        endpoint: Endpoints.BUSCAR_CARGOS,
        data: null);

    List<CargoModel> lista = [];

    retorno.data.forEach((i) => lista.add(CargoModel.fromJson(i)));

    return lista;
  }

  @override
  Future<dynamic> criarFuncionario(
      {String? nome, String? telefone, String? endereco, int? cargo,String? cpf}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_FUNCIONARIO,
        data: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cargo": cargo,
          "cpf":cpf
        },
        dataParameters: {
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cargo": cargo,
           "cpf":cpf
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future<dynamic> editarFuncionario(
      {String? nome,
      String? telefone,
      String? endereco,
      int? cargo,
      String? cpf,
      int? id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.POST,
        endpoint: Endpoints.SALVAR_FUNCIONARIO,
        data: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
           "cpf":cpf,
        },
        dataParameters: {
          "id": id,
          "nome": nome,
          "telefone": telefone,
          "endereco": endereco,
          "cargo": cargo,
           "cpf":cpf,
        },
        sincronizando: true);
    print(retorno);

    return retorno;
  }

  @override
  Future deletarFuncionario({required int id}) async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.DELETE,
        endpoint: Endpoints.DELETAR_FUNCIONARIO,
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
