
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
}
