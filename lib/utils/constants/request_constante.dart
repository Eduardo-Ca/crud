// ignore_for_file: constant_identifier_names

class Request {
  static const String POST = "POST";
  static const String GET = "GET";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";

  static const int UNAUTHORIZED = 401;
  static const int QUANTIDADE_TENTATIVAS = 5;
}

class Endpoints {
  //GET

  static const String BUSCAR_CLIENTES = 'controller/ExibeClientes';
  static const String BUSCAR_FORNECEDORES = 'controller/ExibeFornecedores';
  static const String BUSCAR_PRODUTOS = 'controller/ExibeProdutos';
  static const String BUSCAR_FUNCIONARIOS = 'controller/ExibeFuncionarios';
  static const String BUSCAR_VENDAS = 'Venda/ExibeVendas';
  static const String BUSCAR_VENDAS_POR_DIA = 'Venda/ObterPorPeriodo';
  static const String BUSCAR_CARGOS = 'controller/ObterCargos';
  static const String BUSCAR_PEDIDOS = 'Venda/ExibePedidosVenda';
  static const String BUSCAR_ESTOQUE = 'controller/ExibeEstoque';

  //POST

  static const String SALVAR_CLIENTE = 'controller/SaveClient';
  static const String SALVAR_FORNECEDOR = 'controller/SaveFornecedor';
  static const String SALVAR_FUNCIONARIO = 'controller/SaveFuncionario';
  static const String SALVAR_PRODUTO = 'controller/SaveProduto';
  static const String SALVAR_VENDAS = 'Venda/SaveVenda';
  static const String SALVAR_PEDIDOS = 'controller/SavePedido';
  static const String SALVAR_ESTOQUE = 'controller/AtualizaEstoque';

  //DELETE
  static const String DELETAR_CLIENTE = 'controller/DeletaCliente';
  static const String DELETAR_FORNECEDOR = 'controller/DeletaFornecedor';
  static const String DELETAR_FUNCIONARIO = 'controller​/DeletaFuncionario';
  static const String DELETAR_PRODUTO = 'controller/DeletaProduto';
  static const String DELETAR_VENDAS = 'Venda/DeletaVenda';
  static const String DELETAR_PEDIDOS = 'controller/DeletaPedido';
}
