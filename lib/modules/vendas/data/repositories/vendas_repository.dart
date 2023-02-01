import 'package:teste/modules/funcionario/data/datasource/funcionario_datasource_abst.dart';

import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/repositories/produto_repository.dart';
import 'package:teste/modules/vendas/data/datasource/vendas_datasource_abst.dart';
import 'package:teste/modules/vendas/data/models/vendas_model%20copy.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/repositories/vendas_repository.dart';

class VendasRepository implements IVendasRepository {
  final IVendasDatasource dataSource;

  VendasRepository(
      this.dataSource); //this.datasourceLocal, //this.datasourceRemoto,

  @override
  Future<List<VendasModel>> obterTodasVendas() async {
    return await dataSource.obterTodasVendas();
  }

  @override
  Future<List<VendasModel>> obterVendaPorDia(int? dias) async {
    return await dataSource.obterVendaPorDia(dias);
  }

  @override
  Future<dynamic> criarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra}) async {
    return await dataSource.criarVendas(
        funcionarioId: funcionarioId,
        clienteId: clienteId,
        valorCompra: valorCompra);
  }

  @override
  Future<dynamic> editarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra, int? id}) async {
    return await dataSource.editarVendas(
        funcionarioId: funcionarioId,
        clienteId: clienteId,
        valorCompra: valorCompra,
        id: id);
  }

  @override
  Future<dynamic> deletarVPedidos({required int id}) async {
    return await dataSource.deletarPedidos(id: id);
  }

  @override
  Future<dynamic> criarPedidos(
      {int? vendaId, int? produtoId, int? quantidadeItens}) async {
    return await dataSource.criarPedidos(
        vendaId: vendaId,
        produtoId: produtoId,
        quantidadeItens: quantidadeItens);
  }

  @override
  Future<List<PedidosModel>> obterTodosPedidos() async {
    return await dataSource.obterTodosPedidos();
  }

  @override
  Future<dynamic> deletarPedidos({required int id}) async {
    return await dataSource.deletarPedidos(id: id);
  }

  @override
  Future deletarVendas({required int id}) async {
    return await dataSource.deletarPedidos(id: id);
  }
}
