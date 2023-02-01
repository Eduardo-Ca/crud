import 'package:get_it/get_it.dart';
import 'package:teste/modules/cliente/data/repositories/cliente_repository.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/cliente/external/datasource/cliente_datasource.dart';
import 'package:teste/modules/fornecedor/data/repositories/fornecedor_repository.dart';
import 'package:teste/modules/fornecedor/domain/usecases/fornecedor_usecases.dart';
import 'package:teste/modules/fornecedor/external/datasource/fornecedor_datasource.dart';
import 'package:teste/modules/funcionario/data/repositories/funcionario_repository.dart';
import 'package:teste/modules/funcionario/domain/usecases/funcionario_usecases.dart';
import 'package:teste/modules/funcionario/external/datasource/funcionario_datasource.dart';
import 'package:teste/modules/produto/data/repositories/produto_repository.dart';
import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';
import 'package:teste/modules/produto/external/datasource/produto_datasource.dart';
import 'package:teste/modules/vendas/data/repositories/vendas_repository.dart';
import 'package:teste/modules/vendas/domain/usecases/vendas_usecases.dart';
import 'package:teste/modules/vendas/external/datasource/vendas_datasource.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  //=========================================== CLENTES ======================================================================
  getIt.registerLazySingleton<ClienteDatasource>(() => ClienteDatasource());
  getIt.registerLazySingleton<ClienteRepository>(
      () => ClienteRepository(GetIt.I.get<ClienteDatasource>()));

  getIt.registerLazySingleton<UseCasesCliente>(
      () => UseCasesCliente(GetIt.I.get<ClienteRepository>()));
  //=========================================== CLENTES =====================================================================

  //=========================================== FORNECEDORES ======================================================================
  getIt.registerLazySingleton<FornecedorDatasource>(
      () => FornecedorDatasource());
  getIt.registerLazySingleton<FornecedorRepository>(
      () => FornecedorRepository(GetIt.I.get<FornecedorDatasource>()));

  getIt.registerLazySingleton<UseCasesFornecedor>(
      () => UseCasesFornecedor(GetIt.I.get<FornecedorRepository>()));
  //=========================================== FORNECEDORES =====================================================================

  //=========================================== FUNCIONARIOS ======================================================================
  getIt.registerLazySingleton<FuncionarioDatasource>(
      () => FuncionarioDatasource());
  getIt.registerLazySingleton<FuncionarioRepository>(
      () => FuncionarioRepository(GetIt.I.get<FuncionarioDatasource>()));

  getIt.registerLazySingleton<UseCasesFuncionario>(
      () => UseCasesFuncionario(GetIt.I.get<FuncionarioRepository>()));
  //=========================================== FUNCIONARIOS =====================================================================

  //=========================================== PRODUTOS ======================================================================
  getIt.registerLazySingleton<ProdutoDatasource>(
      () => ProdutoDatasource());
  getIt.registerLazySingleton<ProdutoRepository>(
      () => ProdutoRepository(GetIt.I.get<ProdutoDatasource>()));

  getIt.registerLazySingleton<UseCasesProduto>(
      () => UseCasesProduto(GetIt.I.get<ProdutoRepository>()));
  //=========================================== PRODUTOS =====================================================================

  //=========================================== VENDAS =========================================================================
     getIt.registerLazySingleton<VendasDatasource>(
      () => VendasDatasource());
  getIt.registerLazySingleton<VendasRepository>(
      () => VendasRepository(GetIt.I.get<VendasDatasource>()));

  getIt.registerLazySingleton<UseCasesVendas>(
      () => UseCasesVendas(GetIt.I.get<VendasRepository>()));
  //=========================================== VENDAS =========================================================================
}
