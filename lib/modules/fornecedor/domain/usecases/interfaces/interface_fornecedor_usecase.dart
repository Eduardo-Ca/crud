
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IUsecasesFornecedor{
  
  Future<List<FornecedorModel>>
      obterTodosFornecedores(String? nome); 

  
  Future<dynamic>
      criarFornecedor({String? nome, String? telefone, String? endereco,String? cnpj}); 
  
    Future<dynamic>
      editarFornecedor({String? nome, String? telefone, String? endereco,int? id,String? cnpj}); 

  Future<dynamic>
      deletarFornecedor({required int id}); 

}
