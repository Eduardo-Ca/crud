import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/presenter/form_clientes.dart';
import 'package:teste/modules/fornecedor/presenter/components/form_fornecedores.dart';
import 'package:teste/modules/produto/presenter/components/form_produtos.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaFornecedoresTela extends StatefulWidget {
  const ListaFornecedoresTela({super.key});

  @override
  State<ListaFornecedoresTela> createState() => _ListaFornecedoresTelaState();
}

class _ListaFornecedoresTelaState extends State<ListaFornecedoresTela> {

  Timer? _debounce;

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: BotoesDrawer(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => const FormFornecedores()));
          },
          child: const Icon(MdiIcons.dolly,size: 28,),
        ),
        appBar: AppBar(
          title: const Text("Fornecedores"),
        ),
        body:  Column(
        children: [
          //!============== BARRA DE PESQUISA ===============
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value) => {_onSearchChanged(value)},
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                hintText: 'Procurar',
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),);
  }
   // função para na hora da pesquisa esperar um tempo antes de fazer varias requisições para api
  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(
        () {
          // Endpoints.PRODUTO = 'api/produto/$value';
          // if (value == "") {
          //   Endpoints.PRODUTO = 'api/produto/obterProdutos/';
          // }
        },
      );
    });
  }
}
