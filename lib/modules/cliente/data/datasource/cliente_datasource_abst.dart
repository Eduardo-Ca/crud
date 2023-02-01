import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IClienteDatasource {
  Future<List<ClienteModel>> obterTodosClientes(nome);

  Future<dynamic> criarCliente(nome, telefone, endereco,cpf);

  Future<dynamic> editarCliente(nome, telefone, endereco,cpf,id);

   Future<dynamic> deletarCliente(id);
}
