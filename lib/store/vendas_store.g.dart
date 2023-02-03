// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendasStore on _VendasStore, Store {
  late final _$totalPedidoAtom =
      Atom(name: '_VendasStore.totalPedido', context: context);

  @override
  double get totalPedido {
    _$totalPedidoAtom.reportRead();
    return super.totalPedido;
  }

  @override
  set totalPedido(double value) {
    _$totalPedidoAtom.reportWrite(value, super.totalPedido, () {
      super.totalPedido = value;
    });
  }

  @override
  String toString() {
    return '''
totalPedido: ${totalPedido}
    ''';
  }
}
