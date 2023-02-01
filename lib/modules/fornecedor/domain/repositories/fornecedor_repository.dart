
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';

abstract class IFornecedorRepository {
  Future<List<FornecedorModel>> obterTodosFornecedores(String? nome);

  Future<dynamic> criarFornecedor(
       String? nome,
       String? telefone,
       String? endereco,
       String? cnpj
       );
  
  Future<dynamic> editarFornecedor(
       String? nome,
       String? telefone,
       String? endereco,
       String? cnpj,
       int? id);

  Future<dynamic> deletarFornecedor({required int id});
}
