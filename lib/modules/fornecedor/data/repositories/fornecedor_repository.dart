import 'package:teste/modules/fornecedor/data/datasource/fornecedor_datasource_abst.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/fornecedor/domain/repositories/fornecedor_repository.dart';

class FornecedorRepository implements IFornecedorRepository {
  final IFornecedorDatasource dataSource;

  FornecedorRepository(
      this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<FornecedorModel>> obterTodosFornecedores(String? nome) async {
    return await dataSource.obterTodosFornecedores(nome);
  }

  @override
  Future<dynamic> criarFornecedor(
    String? nome,
    String? telefone,
    String? endereco,
    String? cnpj,
  ) async {
    return await dataSource.criarFornecedor(nome, telefone, endereco, cnpj);
  }

  @override
  Future<dynamic> editarFornecedor(String? nome, String? telefone,
      String? endereco, String? cnpj, int? id) async {
    return await dataSource.editarFornecedor(
        nome, telefone, endereco, cnpj, id);
  }

  @override
  Future<dynamic> deletarFornecedor({required int id}) async {
    return await dataSource.deletarFornecedor(id);
  }
}
