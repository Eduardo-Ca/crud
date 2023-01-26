
import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IUsecasesCliente{
  
  Future<List<ClienteModel>>
      obterTodosClientes(); 

  Future<dynamic>
      criarCliente({String? nome, String? telefone, String? endereco,int? id}); 

  Future<dynamic>
      deletarCliente({required int id}); 

    

}
