// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Pedidos extends Equatable {
  int id;
  int vendaId;
  int produtoId;
  int quantidadeItens;
  Pedidos({
    required this.id,
    required this.vendaId,
    required this.produtoId,
    required this.quantidadeItens,
   
  });

  @override
  List<Object?> get props =>
      [id, vendaId, produtoId, quantidadeItens];
}
