import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';

abstract class IFuncionarioDatasource {
  Future<List<FuncionarioModel>> obterTodosFuncionarios(String? nome);

    Future<List<CargoModel>> obterTodosCargos();

  Future<dynamic> criarFuncionario(
      {String? nome, String? telefone, String? endereco, int? cargo,String? cpf});

  Future<dynamic> editarFuncionario(
      {String? nome,
      String? telefone,
      String? endereco,
      int? cargo,
      String? cpf,
      int? id});

  Future<dynamic> deletarFuncionario({required int id});
}
