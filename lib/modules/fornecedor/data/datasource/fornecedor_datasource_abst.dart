
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IFornecedorDatasource {
  Future<List<FornecedorModel>> obterTodosFornecedores();

  
  Future<dynamic> criarFornecedor(nome, telefone, endereco);

   Future<dynamic> editarFornecedor(nome, telefone, endereco,id);

   Future<dynamic> deletarFornecedor(id);
}
