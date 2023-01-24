
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';


abstract class IUsecasesFuncionario{
  
  Future<List<FuncionarioModel>>
      obterTodosFuncionarios(); 

}
