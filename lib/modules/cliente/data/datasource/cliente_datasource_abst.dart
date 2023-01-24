import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IClienteDatasource {
  Future<List<ClienteModel>> obterTodosClientes();
}
