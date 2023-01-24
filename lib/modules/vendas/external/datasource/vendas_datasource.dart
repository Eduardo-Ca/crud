

import 'package:teste/modules/vendas/data/datasource/vendas_datasource_abst.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
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
  
}
