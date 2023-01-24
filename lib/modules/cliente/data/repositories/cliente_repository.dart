

import 'package:teste/modules/cliente/data/datasource/cliente_datasource_abst.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/repositories/cliente_repository.dart';

class ClienteRepository implements IClienteRepository {
  final IClienteDatasource dataSource;

  ClienteRepository(this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<ClienteModel>> obterTodosClientes() async {
    return await dataSource.obterTodosClientes();
  }

  
  
}
