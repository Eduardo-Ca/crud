import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/entities/produto_entity.dart';
import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';
import 'package:teste/modules/produto/presenter/components/lista_produtos_card.dart';
import 'package:teste/modules/produto/presenter/edicao_produtos%20copy.dart';
import 'package:teste/modules/produto/presenter/form_produtos.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaProdutosTela extends StatefulWidget {
  const ListaProdutosTela({super.key});

  @override
  State<ListaProdutosTela> createState() => _ListaProdutosTelaState();
}

class _ListaProdutosTelaState extends State<ListaProdutosTela> {
  Timer? _debounce;

  late UseCasesProduto _UseCasesProduto;

  @override
  void initState() {
    super.initState();

    _UseCasesProduto = GetIt.I.get<UseCasesProduto>();
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
          final criarProduto = await Navigator.push(context,
              MaterialPageRoute(builder: (contextNew) => const FormProdutos()));
          setState(() {});
        },
        child: const Icon(
          MdiIcons.archivePlus,
          size: 28,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _barraDePesquisa(),
            const Divider(
              thickness: 2,
            ),
            _listaDeProdutos(),
            SizedBox(
              height: 50,
            )
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

  _listaDeProdutos() {
    return SingleChildScrollView(
      child: FutureBuilder<List<ProdutoModel>>(
        future: Future.delayed(const Duration(milliseconds: 400))
            .then((value) => _UseCasesProduto.obterTodosProdutos()),
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
              final List<ProdutoModel>? produtos = snapshot.data;
              if (produtos == null || produtos.isEmpty) {
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
                  itemCount: produtos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        background: Container(
                          color: Colors.red,
                        ),
                        key: ValueKey<Produto>(produtos[index]),
                        onDismissed: (DismissDirection direction) async {
                          setState(() {
                            _UseCasesProduto.deletarProduto(
                                id: produtos[index].id);
                          });
                        },
                        child: ListTile(
                          //tileColor: const Color.fromARGB(255, 110, 150, 209),
                          //!=== Card ===
                          title: ProdutoCard(
                            produto: produtos[index],
                          ),

                          onTap: (() async {
                            final editarProduto = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contextNew) => EdicaoProdutos(
                                          produto: produtos[index],
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
      ),
    );
  }
}
