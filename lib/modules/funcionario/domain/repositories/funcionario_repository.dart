import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';


abstract class IFuncionarioRepository {
  Future<List<FuncionarioModel>> obterTodosFuncionarios();
}
