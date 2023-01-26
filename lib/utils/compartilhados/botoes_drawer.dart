import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/funcionario/presenter/lista_de_funcionarios.dart';
import 'package:teste/modules/cliente/presenter/lista_clientes_tela.dart';
import 'package:teste/modules/fornecedor/presenter/lista_fornecedor_tela.dart';

import 'package:teste/modules/produto/presenter/lista_de_produtos.dart';
import 'package:teste/modules/vendas/presenter/vendas_tela.dart';

class BotoesDrawer extends StatefulWidget {
  const BotoesDrawer({super.key});

  @override
  State<BotoesDrawer> createState() => _BotoesDrawerState();
}

class _BotoesDrawerState extends State<BotoesDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: ListTile(
            leading: Icon(Icons.attach_money, color: Colors.red, size: 28),
            title: Text("Onde vamos? =)",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            subtitle: Text(" Selecione alguma opçâo",
                style: TextStyle(
                  fontSize: 14,
                )),
          ),
        ),
        const Divider(
                  thickness: 2,
                ),
        ListTile(
          leading: const Icon(
            Icons.people,
            color: Colors.red,
            size: 28,
          ),
          title: const Text("Clientes",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const ListaCleintesTela()),
              (Route<dynamic> route) => false),
        ),
        ListTile(
          leading: const Icon(MdiIcons.cashFast, color: Colors.red, size: 28),
          title: const Text("Funcionários",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const ListaFuncionariosTela()),
              (Route<dynamic> route) => false),
        ),
        ListTile(
          leading: const Icon(MdiIcons.dropbox, color: Colors.red, size: 28),
          title: const Text("Produtos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const ListaProdutosTela()),
              (Route<dynamic> route) => false),
        ),
        ListTile(
          leading: const Icon(MdiIcons.humanDolly, color: Colors.red, size: 28),
          title: const Text("Fornecedores",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const ListaFornecedoresTela()),
              (Route<dynamic> route) => false),
        ),
        ListTile(
          leading: const Icon(MdiIcons.cash, color: Colors.red, size: 28),
          title: const Text("Vendas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const VendasTela()),
              (Route<dynamic> route) => false),
        ),
      ],
    );
  }
}
