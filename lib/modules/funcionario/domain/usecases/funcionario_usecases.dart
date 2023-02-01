import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/repositories/funcionario_repository.dart';
import 'package:teste/modules/funcionario/domain/usecases/interfaces/interface_funcionario_usecase.dart';


class UseCasesFuncionario extends IUsecasesFuncionario {
  final IFuncionarioRepository repositoryRemoto;

  UseCasesFuncionario(this.repositoryRemoto);

  @override
  Future<List<FuncionarioModel>> obterTodosFuncionarios(nome) async {
    final result = await repositoryRemoto.obterTodosFuncionarios(nome);

    return result;
  }
   @override
  Future<List<CargoModel>> obterTodosCargos() async {
    final result = await repositoryRemoto.obterTodosCargos();

    return result;
  }

  @override
  Future<dynamic> criarFuncionario({ nome,  telefone,endereco,cargo,cpf}) async{
   
    final resultado = await repositoryRemoto.criarFuncionario(nome,telefone,endereco,cargo,cpf);
    return resultado;
  }

   @override
  Future<dynamic> editarFuncionario({ nome,  telefone,endereco,cargo,cpf,id}) async{
   
    final resultado = await repositoryRemoto.editarFuncionario(nome,telefone,endereco,cargo,cpf,id);
    return resultado;
  }
  
  @override
  Future deletarFuncionario({required int id}) async{
   final resultado = await repositoryRemoto.deletarFuncionario(id: id);
    return resultado;
  }
}
