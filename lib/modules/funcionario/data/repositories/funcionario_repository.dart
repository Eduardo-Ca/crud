

import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/repositories/funcionario_repository.dart';
import 'package:teste/modules/produto/data/datasource/produto_datasource_abst.dart';



class FuncionarioRepository implements IFuncionarioRepository {
  final IFuncionarioDatasource dataSource;

  FuncionarioRepository(this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<FuncionarioModel>> obterTodosFuncionarios() async {
    return await dataSource.obterTodosFuncionarios();
  }

   @override
  Future<dynamic> criarFuncionario(
       String? nome,
       String? telefone,
       String? endereco,
       int? cargo,
       ) async {
    return await dataSource.criarFuncionario(nome: nome,telefone: telefone,endereco: endereco,cargo: cargo);
  }

  
   @override
  Future<dynamic> editarFuncionario(
       String? nome,
       String? telefone,
       String? endereco,
       int? cargo,
       int? id) async {
    return await dataSource.editarFuncionario(nome: nome,telefone: telefone,endereco: endereco,cargo: cargo,id: id);
  }

  @override
  Future<dynamic> deletarFuncionario({required int id}) async {
    return await dataSource.deletarFuncionario(id:id);
  }

  

  
  
}
