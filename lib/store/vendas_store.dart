import 'package:mobx/mobx.dart';

part 'vendas_store.g.dart';

class VendasStore = _VendasStore with _$VendasStore;

abstract class _VendasStore with Store {
  @observable
  double totalPedido = 0;
}

//!flutter pub run build_runner build