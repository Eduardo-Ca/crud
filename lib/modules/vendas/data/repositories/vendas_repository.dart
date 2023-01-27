import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';

import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/repositories/produto_repository.dart';
import 'package:teste/modules/vendas/data/datasource/vendas_datasource_abst.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/repositories/vendas_repository.dart';

class VendasRepository implements IVendasRepository {
  final IVendasDatasource dataSource;

  VendasRepository(
      this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<VendasModel>> obterTodasVendas() async {
    return await dataSource.obterTodasVendas();
  }
}
