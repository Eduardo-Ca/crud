import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IClienteDatasource {
  Future<List<ClienteModel>> obterTodosClientes();

  Future<dynamic> criarCliente(nome, telefone, endereco);

  Future<dynamic> editarCliente(nome, telefone, endereco,id);

   Future<dynamic> deletarCliente(id);
}
