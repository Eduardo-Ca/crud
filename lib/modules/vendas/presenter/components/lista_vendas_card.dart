import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:teste/modules/vendas/data/models/vendas_model.dart';

class VendaCard extends StatefulWidget {
  VendasModel venda;
  VendaCard({super.key, required this.venda});

  @override
  State<VendaCard> createState() => _VendaCardState();
}

class _VendaCardState extends State<VendaCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
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
                      MdiIcons.cash,
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
                Text(
                  widget.venda.clientePedido.toString(),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                 Text(
                  "Valor da compra: ${widget.venda.valorCompra}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  ),
                ),
                
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right:15.0),
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
