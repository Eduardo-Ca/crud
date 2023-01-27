
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/fornecedor/domain/repositories/fornecedor_repository.dart';
import 'package:teste/modules/fornecedor/domain/usecases/interfaces/interface_fornecedor_usecase.dart';

class UseCasesFornecedor extends IUsecasesFornecedor {
  final IFornecedorRepository repositoryRemoto;

  UseCasesFornecedor(this.repositoryRemoto);

  @override
  Future<List<FornecedorModel>> obterTodosFornecedores() async {
    final result = await repositoryRemoto.obterTodosFornecedores();

    return result;
  }

  @override
  Future<dynamic> criarFornecedor({ nome,  telefone,   endereco}) async{
   
    final resultado = await repositoryRemoto.criarFornecedor(nome,telefone,endereco);
    return resultado;
  }

   @override
  Future<dynamic> editarFornecedor({ nome,  telefone,   endereco,id}) async{
   
    final resultado = await repositoryRemoto.editarFornecedor(nome,telefone,endereco,id);
    return resultado;
  }
  
  @override
  Future deletarFornecedor({required int id}) async{
   final resultado = await repositoryRemoto.deletarFornecedor(id: id);
    return resultado;
  }
}
