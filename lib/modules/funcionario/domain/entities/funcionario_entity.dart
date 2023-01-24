// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Funcionario extends Equatable {
  int id;
  String nome;
  String telefone;
  String endereco;
  int cargo;

  Funcionario(
      {this.id = 1, this.nome = "", this.telefone = "", this.endereco = "",this.cargo = 0});

  @override
  List<Object?> get props => [id, nome, telefone, endereco,cargo];
}
