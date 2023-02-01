// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Fornecedor extends Equatable {
  int id;
  String cnpj;
  String nome;
  String telefone;
  String endereco;

  Fornecedor(
      {this.id = 0, this.nome = "", this.telefone = "", this.endereco = "",this.cnpj = ""});

  @override
  List<Object?> get props => [id, nome, telefone, endereco,cnpj];
}
