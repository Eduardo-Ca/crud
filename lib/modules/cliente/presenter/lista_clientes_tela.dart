import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/entities/cliente_entity.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/cliente/presenter/components/lista_clientes_card.dart';
import 'package:teste/modules/cliente/presenter/edicao_cliente.dart';
import 'package:teste/modules/cliente/presenter/form_clientes.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';
import 'package:teste/utils/constants/request_constante.dart';

class ListaCleintesTela extends StatefulWidget {
  const ListaCleintesTela({super.key});

  @override
  State<ListaCleintesTela> createState() => _ListaCleintesTelaState();
}

class _ListaCleintesTelaState extends State<ListaCleintesTela> {
  String valorPesquisa = "";
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
        onPressed: () async {
          final criarCliente = await Navigator.push(context,
              MaterialPageRoute(builder: (contextNew) => const FormCientes()));
          setState(() {});
        },
        child: const Icon(
          MdiIcons.accountMultiplePlus,
          size: 28,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Clientes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _barraDePesquisa(),
            const Divider(
              thickness: 2,
            ),
            _listaDecClientes(),
            const SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }

  _barraDePesquisa() {
    return Padding(
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
    );
  }

  // função para na hora da pesquisa esperar um tempo antes de fazer varias requisições para api
  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(
        () {
         valorPesquisa = value;
        },
      );
    });
  }

  _listaDecClientes() {
    return FutureBuilder<List<ClienteModel>>(
      future: Future.delayed(const Duration(milliseconds: 400))
          .then((value) => _UseCasesCliente.obterTodosClientes(nome: valorPesquisa)),
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
              return Center(
                  child: Column(
                children: [
                  SizedBox(
                    width: 340,
                    height: 320,
                    child: Lottie.network(
                        "https://assets7.lottiefiles.com/packages/lf20_rIg0v53Pan.json"),
                  ),
                  const Text(
                    "Sem informação",
                    style: TextStyle(fontSize: 26, color: Colors.grey),
                  ),
                ],
              ));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: clientes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      key: ValueKey<Cliente>(clientes[index]),
                      onDismissed: (DismissDirection direction) async {
                        setState(() {
                          _UseCasesCliente.deletarCliente(
                              id: clientes[index].id);
                        });
                      },
                      child: ListTile(
                        //!=== Card ===
                        title: ClientesCard(
                          cliente: clientes[index],
                        ),

                        onTap: (() async {
                          final editarCliente = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contextNew) =>
                                      EdicaoCliente(cliente: clientes[index])));
                          setState(() {});
                        }),
                      ));
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
    );
  }
}
