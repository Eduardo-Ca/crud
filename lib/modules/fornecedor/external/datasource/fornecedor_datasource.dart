
import 'package:teste/modules/fornecedor/data/datasource/fornecedor_datasource_abst.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/utils/configuracao_api/request_util.dart';
import 'package:teste/utils/constants/request_constante.dart';


RequestUtil _request = RequestUtil();

class FornecedorDatasource implements IFornecedorDatasource {
  @override
  Future<List<FornecedorModel>> obterTodosFornecedores() async {
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.GET, endpoint: Endpoints.BUSCAR_FORNECEDORES, data: null);

    List<FornecedorModel> lista = [];

    retorno.data.forEach((i) => lista.add(FornecedorModel.fromJson(i)));

    return lista;
  }
}
