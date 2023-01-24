


import 'package:teste/modules/produto/data/models/produto_model.dart';

abstract class IUsecasesProduto{
  
  Future<List<ProdutoModel>>
      obterTodosProdutos(); 

}
