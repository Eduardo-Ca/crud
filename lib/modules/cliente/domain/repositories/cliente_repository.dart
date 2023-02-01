import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IClienteRepository {
  Future<List<ClienteModel>> obterTodosClientes({String? nome});

  Future<dynamic> criarCliente(
       String? nome,
       String? telefone,
       String? endereco,
       String? cpf,
       );

  Future<dynamic> editarCliente(
       String? nome,
       String? telefone,
       String? endereco,
       String? cpf,
       int? id);

  Future<dynamic> deletarCliente({required int id});
}
