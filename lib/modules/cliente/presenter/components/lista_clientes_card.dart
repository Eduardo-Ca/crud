import 'package:flutter/material.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';

class ClientesCard extends StatefulWidget {
  ClienteModel cliente;
  ClientesCard({super.key, required this.cliente});

  @override
  State<ClientesCard> createState() => _ClientesCardState();
}

class _ClientesCardState extends State<ClientesCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                      Icons.people,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cliente.nome,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Text(
                  "CPF: ${widget.cliente.cpf}",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left:55.0),
            child: Icon(
              Icons.chevron_right,
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}
