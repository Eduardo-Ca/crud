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
                  "Preço: ${(widget.produto.precoUnitario * widget.produto.quantidade).toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
              Text("Quantidade: ${widget.produto.quantidade}",
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
              Text("Quantidade estoque: ${widget.produto.quantidadeEstoque}",
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    widget.produto.quantidade > 0
                        ? setState(() {
                            widget.produto.quantidade -= 1;
                            widget.vendaStore.totalPedido -=
                                widget.produto.precoUnitario;
                          })
                        : null;
                  },
                  icon: const Icon(Icons.indeterminate_check_box_outlined)),
              IconButton(
                  onPressed: () {
                    widget.produto.quantidadeEstoque > widget.produto.quantidade
                        ? setState(() {
                            widget.produto.quantidade += 1;
                            widget.vendaStore.totalPedido +=
                                widget.produto.precoUnitario;
                          })
                        : null;
                  },
                  icon: const Icon(Icons.add_box_outlined)),
            ],
          ),
        ],
      ),
    );
  }
}
