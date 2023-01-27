
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IFornecedorRepository {
  Future<List<FornecedorModel>> obterTodosFornecedores();

  Future<dynamic> criarFornecedor(
       String? nome,
       String? telefone,
       String? endereco,
       );
  
  Future<dynamic> editarFornecedor(
       String? nome,
       String? telefone,
       String? endereco,
       int? id);

  Future<dynamic> deletarFornecedor({required int id});
}
