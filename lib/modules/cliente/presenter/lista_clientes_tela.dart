import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/cliente/presenter/components/lista_clientes_card.dart';
import 'package:teste/modules/cliente/presenter/form_clientes.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaCleintesTela extends StatefulWidget {
  const ListaCleintesTela({super.key});

  @override
  State<ListaCleintesTela> createState() => _ListaCleintesTelaState();
}

class _ListaCleintesTelaState extends State<ListaCleintesTela> {
  late UseCasesCliente _UseCasesCliente;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _UseCasesCliente = GetIt.I.get<UseCasesCliente>();
  }

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
          Navigator.push(context,
              MaterialPageRoute(builder: (contextNew) => const FormCientes()));
        },
        child: const Icon(
          MdiIcons.accountMultiplePlus,
          size: 28,
        ),
      ),
      appBar: AppBar(
        title: const Text("Clientes"),
      ),
      body: SingleChildScrollView(
        child: Column(
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

            //!==================== LISTA DE CLIENTES ===============
            FutureBuilder<List<ClienteModel>>(
              future: Future.delayed(const Duration(milliseconds: 400))
                  .then((value) => _UseCasesCliente.obterTodosClientes()),
              initialData: const [],
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(child: Text("Erro"));

                  case ConnectionState.waiting:
                    return const Center(
                      child: SpinKitCircle(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );

                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    final List<ClienteModel>? clientes = snapshot.data;
                    if (clientes == null || clientes.isEmpty) {
                      return const Center(
                          child: Text(
                        "Sem informação",
                        style: TextStyle(fontSize: 26, color: Colors.black),
                      ));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: clientes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            //tileColor: const Color.fromARGB(255, 110, 150, 209),
                            //!=== Card ===
                            title: ClientesCard(cliente: clientes[index],),

                            onTap: (() {}),
                          );
                        },
                      );
                    }
                }
                return const Center(
                    child: Text(
                  "Sem informação",
                  style: TextStyle(fontSize: 33, color: Colors.black),
                ));
              }),
            ),
          ],
        ),
      ),
    );
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
