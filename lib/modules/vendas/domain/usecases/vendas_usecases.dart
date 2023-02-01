import 'package:teste/modules/vendas/data/models/vendas_model%20copy.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/repositories/vendas_repository.dart';
import 'package:teste/modules/vendas/domain/usecases/interfaces/interface_vendas_usecase.dart';


class UseCasesVendas extends IUsecasesVendas {
  final IVendasRepository repositoryRemoto;

  UseCasesVendas(this.repositoryRemoto);

  @override
  Future<List<VendasModel>> obterTodasVendas() async {
    final result = await repositoryRemoto.obterTodasVendas();

    return result;
  }

  @override
  Future<List<VendasModel>> obterVendaPorDia(dias) async {
    final result = await repositoryRemoto.obterVendaPorDia(dias);

    return result;
  }

  @override
  Future<dynamic> criarVendas({ funcionarioId,clienteId,valorCompra}) async{
   
    final resultado = await repositoryRemoto.criarVendas(funcionarioId:funcionarioId,clienteId:clienteId,valorCompra:valorCompra);
    return resultado;
  }

   @override
  Future<dynamic> editarVendas({ funcionarioId,clienteId,valorCompra,id}) async{
   
    final resultado = await repositoryRemoto.editarVendas(funcionarioId:funcionarioId,clienteId:clienteId,valorCompra:valorCompra,id:id);
    return resultado;
  }
  
  @override
  Future deletarVendas({required int id}) async{
   final resultado = await repositoryRemoto.deletarVendas(id: id);
    return resultado;
  }

   @override
  Future<dynamic> criarPedidos({  int? vendaId, int? produtoId,int?quantidadeItens}) async{
   
    final resultado = await repositoryRemoto.criarPedidos(vendaId:vendaId,produtoId:produtoId,quantidadeItens:quantidadeItens);
    return resultado;
  }

   @override
  Future deletarPedidos({required int id}) async{
   final resultado = await repositoryRemoto. deletarPedidos(id: id);
    return resultado;
  }

   @override
  Future<List<PedidosModel>> obterTodosPedidos() async {
    final result = await repositoryRemoto.obterTodosPedidos();

    return result;
  }
  
 
}
