import 'package:teste/modules/cliente/data/datasource/cliente_datasource_abst.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/repositories/cliente_repository.dart';

class ClienteRepository implements IClienteRepository {
  final IClienteDatasource dataSource;

  ClienteRepository(
      this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<ClienteModel>> obterTodosClientes() async {
    return await dataSource.obterTodosClientes();
  }

  @override
  Future<dynamic> criarCliente(
       String? nome,
       String? telefone,
       String? endereco,
       ) async {
    return await dataSource.criarCliente(nome, telefone, endereco);
  }

  
  @override
  Future<dynamic> editarCliente(
       String? nome,
       String? telefone,
       String? endereco,
       int? id) async {
    return await dataSource.editarCliente(nome, telefone, endereco,id);
  }

  @override
  Future<dynamic> deletarCliente({required int id}) async {
    return await dataSource.deletarCliente(id);
  }
}
