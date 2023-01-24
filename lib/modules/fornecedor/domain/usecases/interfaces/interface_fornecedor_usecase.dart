
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IUsecasesFornecedor{
  
  Future<List<FornecedorModel>>
      obterTodosFornecedores(); 

}
