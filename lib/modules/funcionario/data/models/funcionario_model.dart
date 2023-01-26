import 'dart:convert';

import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';


class FuncionarioModel extends Funcionario {
  FuncionarioModel({
    int? id,
    String? nome,
    String? telefone,
    String? endereco,
    int? cargo
  }) : super(
          id: id ?? 0,
          nome: nome ?? "",
          telefone: telefone ?? "",
          endereco: endereco ?? "",
          cargo: cargo ?? 0
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco,
      'cargo' : cargo
    };
  }

  factory FuncionarioModel.fromJson(Map<String, dynamic> map) {
    return FuncionarioModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      endereco: map['endereco'] as String,
      cargo: map['cargo'] as int
    );
  }


}
