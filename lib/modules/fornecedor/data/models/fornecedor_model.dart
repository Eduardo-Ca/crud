import 'dart:convert';

import 'package:teste/modules/cliente/domain/entities/cliente_entity.dart';
import 'package:teste/modules/fornecedor/domain/entities/fornecedor_entity.dart';

class FornecedorModel extends Fornecedor {
  FornecedorModel({
    int? id,
    String? cnpj,
    String? nome,
    String? telefone,
    String? endereco,
  }) : super(
          id: id ?? 0,
          cnpj: cnpj ?? "",
          nome: nome ?? "",
          telefone: telefone ?? "",
          endereco: endereco ?? "",
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'cnpj':cnpj,
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco
    };
  }

  factory FornecedorModel.fromJson(Map<String, dynamic> map) {
    return FornecedorModel(
      id: map['id'] as int,
      cnpj: map['cnpj'] ,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      endereco: map['endereco'] as String,
    );
  }

 
}
