// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Cliente extends Equatable {
  int id;
  String cpf;
  String nome;
  String telefone;
  String endereco;

  Cliente(
      {this.id = 0, this.nome = "", this.telefone = "", this.endereco = "",this.cpf = ""});

  @override
  List<Object?> get props => [id,cpf, nome, telefone, endereco];
}
