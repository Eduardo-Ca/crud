

import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/repositories/funcionario_repository.dart';
import 'package:teste/modules/produto/data/datasource/produto_datasource_abst.dart';



class FuncionarioRepository implements IFuncionarioRepository {
  final IFuncionarioDatasource dataSource;

  FuncionarioRepository(this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<FuncionarioModel>> obterTodosFuncionarios(String? nome) async {
    return await dataSource.obterTodosFuncionarios(nome);
  }

  @override
  Future<List<CargoModel>> obterTodosCargos() async {
    return await dataSource.obterTodosCargos();
  }

   @override
  Future<dynamic> criarFuncionario(
       String? nome,
       String? telefone,
       String? endereco,
       int? cargo,
       String? cpf
       ) async {
    return await dataSource.criarFuncionario(nome: nome,telefone: telefone,endereco: endereco,cargo: cargo,cpf:cpf);
  }

  
   @override
  Future<dynamic> editarFuncionario(
       String? nome,
       String? telefone,
       String? endereco,
       int? cargo,
       String? cpf,
       int? id) async {
    return await dataSource.editarFuncionario(nome: nome,telefone: telefone,endereco: endereco,cargo: cargo,cpf:cpf,id: id);
  }

  @override
  Future<dynamic> deletarFuncionario({required int id}) async {
    return await dataSource.deletarFuncionario(id:id);
  }

  

  
  
}
