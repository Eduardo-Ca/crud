import 'package:teste/modules/vendas/data/models/vendas_model.dart';


abstract class IVendasRepository {
  Future<List<VendasModel>> obterTodasVendas();
}
