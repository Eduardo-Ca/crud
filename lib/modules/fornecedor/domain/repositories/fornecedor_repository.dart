
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IFornecedorRepository {
  Future<List<FornecedorModel>> obterTodosFornecedores();
}
