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

  static const String BUSCAR_CLIENTES = 'api/v2/prevenda/prevendaitens';
  static const String BUSCAR_FORNECEDORES = 'api/v2/prevenda/prevendaitens';
  static const String BUSCAR_PRODUTOS = 'api/v2/prevenda/prevendaitens';
  static const String BUSCAR_FUNCIONARIOS = 'api/v2/prevenda/prevendaitens';
  static const String BUSCAR_VENDAS = 'api/v2/prevenda/prevendaitens';
 

  //POST

  static const String EXCLUIR_PRODUTOS_FICHA = 'api/v1/prevenda/cancelamento';

}
