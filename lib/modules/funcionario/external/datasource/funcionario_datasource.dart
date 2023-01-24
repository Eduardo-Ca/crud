
import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/produto/data/datasource/produto_datasource_abst.dart';

import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';


RequestUtil _request = RequestUtil();

class FuncionarioDatasource implements IFuncionarioDatasource {
  @override
  Future<List<FuncionarioModel>> obterTodosFuncionarios() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_FUNCIONARIOS, data: null);

    List<FuncionarioModel> lista = [];

    retorno.data.forEach((i) => lista.add(FuncionarioModel.fromJson(i)));

    return lista;
  }
  
}
