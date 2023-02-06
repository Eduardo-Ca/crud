import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/fornecedor/domain/entities/fornecedor_entity.dart';

import 'package:teste/modules/fornecedor/domain/usecases/fornecedor_usecases.dart';
import 'package:teste/modules/fornecedor/presenter/components/lista_fornecedores_card.dart';
import 'package:teste/modules/fornecedor/presenter/edicao_fornecedores.dart';
import 'package:teste/modules/fornecedor/presenter/form_fornecedores.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaFornecedoresTela extends StatefulWidget {
  const ListaFornecedoresTela({super.key});

  @override
  State<ListaFornecedoresTela> createState() => _ListaFornecedoresTelaState();
}

class _ListaFornecedoresTelaState extends State<ListaFornecedoresTela> {
  String valorPesquisa = "";
  late UseCasesFornecedor _UseCasesFornecedor;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    _UseCasesFornecedor = GetIt.I.get<UseCasesFornecedor>();
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
          final criarFornecedor = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => const FormFornecedores()));
          setState(() {});
        },
        child: const Icon(
          MdiIcons.dolly,
          size: 28,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Fornecedores"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _barraDePesquisa(),
            const Divider(
              thickness: 2,
            ),
            _listaDeFornecedores(),
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

  _listaDeFornecedores() {
    return FutureBuilder<List<FornecedorModel>>(
      future: Future.delayed(const Duration(milliseconds: 400))
          .then((value) => _UseCasesFornecedor.obterTodosFornecedores(valorPesquisa)),
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
            final List<FornecedorModel>? fornecedores = snapshot.data;
            if (fornecedores == null || fornecedores.isEmpty) {
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
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: fornecedores.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      key: ValueKey<Fornecedor>(fornecedores[index]),
                      onDismissed: (DismissDirection direction) async {
                        setState(() {
                          _UseCasesFornecedor.deletarFornecedor(
                              id: fornecedores[index].id);
                        });
                      },
                      child: ListTile(
                        //tileColor: const Color.fromARGB(255, 110, 150, 209),
                        //!=== Card ===
                        title: ListTile(
                          title: FornecedoresCard(
                            fornecedor: fornecedores[index],
                          ),
                        ),

                        onTap: (() async {
                          final editarFornecedor = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contextNew) => EdicaoFornecedores(
                                        fornecedor: fornecedores[index],
                                      )));
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
