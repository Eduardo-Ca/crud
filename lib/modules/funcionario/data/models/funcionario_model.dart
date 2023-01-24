import 'dart:convert';

import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';


class FuncionarioModel extends Funcionario {
  FuncionarioModel({
    int? Id,
    String? Nome,
    String? Telefone,
    String? Endereco,
    int? Cargo
  }) : super(
          id: Id ?? 0,
          nome: Nome ?? "",
          telefone: Telefone ?? "",
          endereco: Endereco ?? "",
          cargo: Cargo ?? 0
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': id,
      'Nome': nome,
      'Telefone': telefone,
      'Endereco': endereco,
      'Cargo' : cargo
    };
  }

  factory FuncionarioModel.fromMap(Map<String, dynamic> map) {
    return FuncionarioModel(
      Id: map['Id'] as int,
      Nome: map['nome'] as String,
      Telefone: map['telefone'] as String,
      Endereco: map['endereco'] as String,
      Cargo: map['Cargo'] as int
    );
  }

  String toJson() => json.encode(toMap());

  factory FuncionarioModel.fromJson(String source) =>
      FuncionarioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
