import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/repositories/cliente_repository.dart';
import 'package:teste/modules/cliente/domain/usecases/interfaces/interface_cliente_usecase.dart';

class UseCasesCliente extends IUsecasesCliente {
  final IClienteRepository repositoryRemoto;

  UseCasesCliente(this.repositoryRemoto);

  @override
  Future<List<ClienteModel>> obterTodosClientes() async {
    final result = await repositoryRemoto.obterTodosClientes();

    return result;
  }
}
