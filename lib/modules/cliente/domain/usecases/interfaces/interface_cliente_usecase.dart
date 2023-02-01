
import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IUsecasesCliente{
  
  Future<List<ClienteModel>>
      obterTodosClientes({String? nome}); 

  Future<dynamic>
      criarCliente({String? nome, String? telefone, String? endereco,String? cpf}); 
  
   Future<dynamic>
      editarCliente({String? nome, String? telefone, String? endereco,int? id,String? cpf}); 

  Future<dynamic>
      deletarCliente({required int id}); 

    

}
