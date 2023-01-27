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
  
  @override
  Future<dynamic> criarCliente({ nome,  telefone,   endereco}) async{
   
    final resultado = await repositoryRemoto.criarCliente(nome,telefone,endereco);
    return resultado;
  }

  
  @override
  Future<dynamic> editarCliente({ nome,  telefone,   endereco,id}) async{
   
    final resultado = await repositoryRemoto.editarCliente(nome,telefone,endereco,id);
    return resultado;
  }
  
  @override
  Future deletarCliente({required int id}) async{
   final resultado = await repositoryRemoto.deletarCliente(id: id);
    return resultado;
  }

 
}
