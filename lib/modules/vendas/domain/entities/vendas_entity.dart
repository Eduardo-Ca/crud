// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

class Vendas extends Equatable {
  int id;
  String clientePedido;
  String funcionarioPedido;
  String dataVenda;
  double valorCompra;
  Vendas({
    required this.id,
    required this.clientePedido,
    required this.funcionarioPedido,
    required this.dataVenda,
    required this.valorCompra,
  });

  

  @override
  List<Object?> get props => [id, clientePedido, funcionarioPedido, dataVenda,valorCompra];

 
}
