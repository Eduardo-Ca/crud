import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/repositories/vendas_repository.dart';
import 'package:teste/modules/vendas/domain/usecases/interfaces/interface_vendas_usecase.dart';


class UseCasesVendas extends IUsecasesVendas {
  final IVendasRepository repositoryRemoto;

  UseCasesVendas(this.repositoryRemoto);

  @override
  Future<List<VendasModel>> obterTodasVendas() async {
    final result = await repositoryRemoto.obterTodasVendas();

    return result;
  }
}
