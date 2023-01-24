
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';


abstract class IUsecasesVendas{
  
  Future<List<VendasModel>>
      obterTodasVendas(); 

}
