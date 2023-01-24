
import 'package:get_it/get_it.dart';
import 'package:teste/modules/cliente/data/repositories/cliente_repository.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/cliente/external/datasource/cliente_datasource.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  //=========================================== CLENTES ======================================================================
  getIt.registerLazySingleton<ClienteDatasource>(
      () => ClienteDatasource());
  getIt.registerLazySingleton<ClienteRepository>(
      () => ClienteRepository(GetIt.I.get<ClienteDatasource>()));

  getIt.registerLazySingleton<UseCasesCliente>(
      () => UseCasesCliente(GetIt.I.get<ClienteRepository>()));
  //=========================================== CLENTES =====================================================================

}