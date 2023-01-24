import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/repositories/funcionario_repository.dart';
import 'package:teste/modules/funcionario/domain/usecases/interfaces/interface_funcionario_usecase.dart';


class UseCasesFuncionario extends IUsecasesFuncionario {
  final IFuncionarioRepository repositoryRemoto;

  UseCasesFuncionario(this.repositoryRemoto);

  @override
  Future<List<FuncionarioModel>> obterTodosFuncionarios() async {
    final result = await repositoryRemoto.obterTodosFuncionarios();

    return result;
  }
}