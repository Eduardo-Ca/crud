import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IClienteRepository {
  Future<List<ClienteModel>> obterTodosClientes();
}
