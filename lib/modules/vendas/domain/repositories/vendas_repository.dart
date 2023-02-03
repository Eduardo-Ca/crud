import 'package:teste/modules/vendas/data/models/pedidos_model.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';

abstract class IVendasRepository {
  Future<List<VendasModel>> obterTodasVendas();
  Future<List<VendasModel>> obterVendaPorDia(int? dias);

  Future<dynamic> criarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra});

  Future<dynamic> editarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra, int? id});

  Future<dynamic> deletarVendas({required int id});

   Future<List<PedidosModel>> obterTodosPedidos({required int vendaId});

   Future<dynamic> criarPedidos(
      { int? vendaId, int? produtoId,int?quantidadeItens});

  Future<dynamic> deletarPedidos({required int id});
}
