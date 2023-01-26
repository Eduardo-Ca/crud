import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';


abstract class IFuncionarioDatasource {
  Future<List<FuncionarioModel>> obterTodosFuncionarios();
}
