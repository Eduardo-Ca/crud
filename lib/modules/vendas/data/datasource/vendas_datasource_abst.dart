import 'package:teste/modules/vendas/data/models/vendas_model%20copy.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';

abstract class IVendasDatasource {
  Future<List<VendasModel>> obterTodasVendas();
  Future<List<VendasModel>> obterVendaPorDia(int? dias);

  Future<dynamic> criarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra});

  Future<dynamic> editarVendas(
      {int? funcionarioId, int? clienteId, int? valorCompra, int? id});

  Future<dynamic> deletarVendas({required int id});

  Future<List<PedidosModel>> obterTodosPedidos();

  Future<dynamic> criarPedidos(
      {int? vendaId, int? produtoId, int? quantidadeItens});

  Future<dynamic> deletarPedidos({required int id});
}
