import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';

class ProdutoCard extends StatefulWidget {
  ProdutoModel produto;
  ProdutoCard({super.key, required this.produto});

  @override
  State<ProdutoCard> createState() => _ProdutoCardState();
}

class _ProdutoCardState extends State<ProdutoCard> {
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
            padding: const EdgeInsets.all(0.0),
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
                      MdiIcons.archive,
                      size: 28,
                     
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      widget.produto.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Quantidade: ${widget.produto.quantidadeEstoque}",
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.grey
                      
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Preço: ${widget.produto.precoUnitario}",
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.grey
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:2.0),
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
