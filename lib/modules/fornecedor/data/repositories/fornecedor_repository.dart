
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

  
  
}
