import 'dart:convert';

import 'package:teste/modules/funcionario/domain/entities/cargo_entity.dart';
import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';


class CargoModel extends Cargo {
  CargoModel({
    int? id,
    String? nome,
   
  }) : super(
          id: id ?? 0,
          nome: nome ?? "",
         
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
    
    };
  }

  factory CargoModel.fromJson(Map<String, dynamic> map) {
    return CargoModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      
    );
  }


}
