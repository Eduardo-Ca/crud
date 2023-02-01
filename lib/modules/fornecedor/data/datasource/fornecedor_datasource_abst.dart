
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IFornecedorDatasource {
  Future<List<FornecedorModel>> obterTodosFornecedores(String? nome);

  
  Future<dynamic> criarFornecedor(nome, telefone, endereco,cnpj);

   Future<dynamic> editarFornecedor(nome, telefone, endereco,cnpj,id);

   Future<dynamic> deletarFornecedor(id);
}
