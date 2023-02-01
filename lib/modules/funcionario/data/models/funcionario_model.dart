import 'dart:convert';

import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';


class FuncionarioModel extends Funcionario {
  FuncionarioModel({
    int? id,
    String? cpf,
    String? nome,
    String? telefone,
    String? endereco,
    String? cargo
  }) : super(
          id: id ?? 0,
          cpf:cpf ??"",
          nome: nome ?? "",
          telefone: telefone ?? "",
          endereco: endereco ?? "",
          cargo: cargo ?? ""
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'cpf': cpf,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco,
      'cargo' : cargo
    };
  }

  factory FuncionarioModel.fromJson(Map<String, dynamic> map) {
    return FuncionarioModel(
      id: map['id'] as int,
      cpf: map['cpf'] ,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      endereco: map['endereco'] as String,
      cargo: map['cargo'] as String
    );
  }


}
