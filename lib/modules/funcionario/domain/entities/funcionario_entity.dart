// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Funcionario extends Equatable {
  int id;
  String cpf;
  String nome;
  String telefone;
  String endereco;
  String cargo;

  Funcionario(
      {this.id = 0,this.cpf = "", this.nome = "", this.telefone = "", this.endereco = "",this.cargo = ""});

  @override
  List<Object?> get props => [id,cpf, nome, telefone, endereco,cargo];
}
