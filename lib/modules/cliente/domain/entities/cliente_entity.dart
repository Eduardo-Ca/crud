// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Cliente extends Equatable {
  int id;
  String nome;
  String telefone;
  String endereco;

  Cliente(
      {this.id = 1, this.nome = "", this.telefone = "", this.endereco = ""});

  @override
  List<Object?> get props => [id, nome, telefone, endereco];
}
