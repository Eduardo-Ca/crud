import 'dart:convert';

import 'package:teste/modules/cliente/domain/entities/cliente_entity.dart';

class FornecedorModel extends Cliente {
  FornecedorModel({
    int? Id,
    String? Nome,
    String? Telefone,
    String? Endereco,
  }) : super(
          id: Id ?? 0,
          nome: Nome ?? "",
          telefone: Telefone ?? "",
          endereco: Endereco ?? "",
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': id,
      'Nome': nome,
      'Telefone': telefone,
      'Endereco': endereco
    };
  }

  factory FornecedorModel.fromMap(Map<String, dynamic> map) {
    return FornecedorModel(
      Id: map['Id'] as int,
      Nome: map['nome'] as String,
      Telefone: map['telefone'] as String,
      Endereco: map['endereco'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FornecedorModel.fromJson(String source) =>
      FornecedorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
