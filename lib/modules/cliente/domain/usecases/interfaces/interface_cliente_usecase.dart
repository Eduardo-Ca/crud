
import 'package:teste/modules/cliente/data/models/cliente_model.dart';

abstract class IUsecasesCliente{
  
  Future<List<ClienteModel>>
      obterTodosClientes(); 

}
