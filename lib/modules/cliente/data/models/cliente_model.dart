import 'dart:convert';

import 'package:teste/modules/cliente/domain/entities/cliente_entity.dart';

class ClienteModel extends Cliente {
  ClienteModel({
    int? id,
    String? cpf,
    String? nome,
    String? telefone,
    String? endereco,
    
  }) : super(
          id: id ?? 0,
          cpf: cpf ?? "",
          nome: nome ?? "",
          telefone: telefone ?? "",
          endereco: endereco ?? "",
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'cpf':cpf,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco
    };
  }

  factory ClienteModel.fromJson(Map<String, dynamic> map) {
    return ClienteModel(
      id: map['id'] as int,
      cpf: map['cpf'],
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      endereco: map['endereco'] as String,
    );
  }

  
}
