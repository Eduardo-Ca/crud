
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IFornecedorDatasource {
  Future<List<FornecedorModel>> obterTodosFornecedores();
}
