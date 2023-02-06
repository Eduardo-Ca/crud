import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';

class FuncionarioCard extends StatefulWidget {
  FuncionarioModel funcionario;
  FuncionarioCard({super.key, required this.funcionario});

  @override
  State<FuncionarioCard> createState() => _FuncionarioCardState();
}

class _FuncionarioCardState extends State<FuncionarioCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Card(
      margin: EdgeInsets.zero,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      MdiIcons.briefcase,
                      size: 28,
                     
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            
            children: [
              Center(
                child: Text(
                  widget.funcionario.nome,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Center(
                  child: Text(
                    "Cargo: ${widget.funcionario.cargo}",
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.grey
                      
                    ),
                  ),
                ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right:10.0),
            child: Icon(
              Icons.chevron_right,
              size: 34,
            ),
          ),
        ],
      ),
    ),
    );
  }
}
