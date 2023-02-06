import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/fornecedor/domain/usecases/fornecedor_usecases.dart';
import 'package:teste/modules/produto/data/models/estoque_model.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';

import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';

import 'package:teste/modules/produto/presenter/form_estoque.dart';

import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaEstoque extends StatefulWidget {
  const ListaEstoque({super.key});

  @override
  State<ListaEstoque> createState() => _ListaEstoqueState();
}

class _ListaEstoqueState extends State<ListaEstoque> {
  String valorPesquisa = "";
  List<ProdutoModel> dropProduto = [];
  List<FornecedorModel> dropFornecedor = [];
  Timer? _debounce;

  bool chip1Selecionado = true;
  bool chip2Selecionado = false;
  bool chip3Selecionado = false;
  bool chip4Selecionado = false;

  late UseCasesProduto _UseCasesProduto;
  late UseCasesFornecedor _useCasesFornecedor;

  @override
  void initState() {
    super.initState();

    _UseCasesProduto = GetIt.I.get<UseCasesProduto>();
    _useCasesFornecedor = GetIt.I.get<UseCasesFornecedor>();
    dropLists();
  }

  dropListProdutos() async {
    final List<ProdutoModel> dropProduto =
        await _UseCasesProduto.obterTodosProdutos(valorPesquisa);
    return dropProduto;
  }

  dropListFornecedores() async {
    final List<FornecedorModel> dropFornecedor =
        await _useCasesFornecedor.obterTodosFornecedores(valorPesquisa);
    return dropFornecedor;
  }

  dropLists() async {
    dropProduto = await dropListProdutos();
    dropFornecedor = await dropListFornecedores();
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
          final criarProduto = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormEstoque(
                        dropProdutos: dropProduto,
                        dropFornecedor: dropFornecedor,
                      )));
          setState(() {});
        },
        child: const Icon(
          MdiIcons.archivePlus,
          size: 28,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Estoque"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _chips(),
            const Divider(
              thickness: 2,
            ),
            _listaEstoque(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  _listaEstoque() {
    return FutureBuilder<List<EstoqueModel>>(
      future: Future.delayed(const Duration(milliseconds: 400))
          .then((value) => chip1Selecionado
              ? _UseCasesProduto.obterEstoque(0)
              : chip2Selecionado
                  ? _UseCasesProduto.obterEstoque(1)
                  : chip3Selecionado
                      ? _UseCasesProduto.obterEstoque(5)
                      : _UseCasesProduto.obterEstoque(10)),
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
            final List<EstoqueModel>? estoque = snapshot.data;
            if (estoque == null || estoque.isEmpty) {
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
                controller: ScrollController(),
                itemCount: estoque.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    //tileColor: const Color.fromARGB(255, 110, 150, 209),
                    //!=== Card ===
                    title: Container(
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              estoque[index].produto,
                              style: const TextStyle(fontSize: 19),
                            ),
                            Text(
                              "Fornecedor: ${estoque[index].fornecedorProduto}",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "Quantidade: ${estoque[index].quantidadeItens}",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "Data de entrada: ${estoque[index].dataEntradaEstoque.replaceRange(10, 19, "")}",
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                      )),
                    ),
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
    );
  }

  _chips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ChoiceChip(
              backgroundColor: Colors.grey[700],
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Todos",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              selected: chip1Selecionado,
              selectedColor: Colors.red,
              onSelected: (newState) {
                setState(() {
                  chip1Selecionado = newState;
                  chip2Selecionado = false;
                  chip3Selecionado = false;
                  chip4Selecionado = false;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ChoiceChip(
              backgroundColor: Colors.grey[700],
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Ontem", style: TextStyle(color: Colors.white)),
              ),
              selected: chip2Selecionado,
              selectedColor: Colors.red,
              onSelected: (newState) {
                setState(() {
                  chip2Selecionado = newState;
                  chip4Selecionado = false;
                  chip3Selecionado = false;
                  chip1Selecionado = false;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ChoiceChip(
              backgroundColor: Colors.grey[700],
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Há 5 dias", style: TextStyle(color: Colors.white)),
              ),
              selected: chip3Selecionado,
              selectedColor: Colors.red,
              onSelected: (newState) {
                setState(() {
                  chip3Selecionado = newState;
                  chip1Selecionado = false;
                  chip2Selecionado = false;
                  chip4Selecionado = false;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ChoiceChip(
              backgroundColor: Colors.grey[700],
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Text("Há 10 dias", style: TextStyle(color: Colors.white)),
              ),
              selected: chip4Selecionado,
              selectedColor: Colors.red,
              onSelected: (newState) {
                setState(() {
                  chip4Selecionado = newState;
                  chip3Selecionado = false;
                  chip2Selecionado = false;
                  chip1Selecionado = false;
                });
              }),
        ),
      ],
    );
  }
}
