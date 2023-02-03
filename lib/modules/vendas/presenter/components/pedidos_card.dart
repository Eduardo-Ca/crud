import 'package:flutter/material.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/store/vendas_store.dart';

class PedidosCard extends StatefulWidget {
  ProdutoModel produto;
  VendasStore vendaStore;
  PedidosCard({super.key, required this.produto, required this.vendaStore});

  @override
  State<PedidosCard> createState() => _PedidosCardState();
}

class _PedidosCardState extends State<PedidosCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.produto.nome,
              ),
              Text(
                  "Preço: ${(widget.produto.precoUnitario ).toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
             
              Text("Quantidade estoque: ${widget.produto.quantidadeEstoque}",
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
         
          
        ],
      ),
    );
  }
}
