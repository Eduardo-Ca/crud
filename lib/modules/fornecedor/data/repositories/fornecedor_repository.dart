
import 'package:teste/modules/fornecedor/data/datasource/fornecedor_datasource_abst.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/fornecedor/domain/repositories/fornecedor_repository.dart';

class FornecedorRepository implements IFornecedorRepository {
  final IFornecedorDatasource dataSource;

  FornecedorRepository(this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<FornecedorModel>> obterTodosFornecedores() async {
    return await dataSource.obterTodosFornecedores();
  }

   @override
  Future<dynamic> criarFornecedor(
       String? nome,
       String? telefone,
       String? endereco,
       ) async {
    return await dataSource.criarFornecedor(nome, telefone, endereco);
  }

  
   @override
  Future<dynamic> editarFornecedor(
       String? nome,
       String? telefone,
       String? endereco,
       int? id) async {
    return await dataSource.editarFornecedor(nome, telefone, endereco,id);
  }

  @override
  Future<dynamic> deletarFornecedor({required int id}) async {
    return await dataSource.deletarFornecedor(id);
  }

  
  
}
