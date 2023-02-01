// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Cargo extends Equatable {
  int id;
  String nome;
 

  Cargo(
      {this.id = 1, this.nome = ""});

  @override
  List<Object?> get props => [id, nome, ];
}
