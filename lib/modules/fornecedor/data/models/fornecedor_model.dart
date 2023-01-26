import 'dart:convert';

import 'package:teste/modules/cliente/domain/entities/cliente_entity.dart';

class FornecedorModel extends Cliente {
  FornecedorModel({
    int? id,
    String? nome,
    String? telefone,
    String? endereco,
  }) : super(
          id: id ?? 0,
          nome: nome ?? "",
          telefone: telefone ?? "",
          endereco: endereco ?? "",
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco
    };
  }

  factory FornecedorModel.fromJson(Map<String, dynamic> map) {
    return FornecedorModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      endereco: map['endereco'] as String,
    );
  }

 
}
