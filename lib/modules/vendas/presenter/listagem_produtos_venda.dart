import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/usecases/vendas_usecases.dart';
import 'package:teste/modules/vendas/presenter/components/pedidos_card.dart';
import 'package:teste/store/vendas_store.dart';

class ListagemProdutosVenda extends StatefulWidget {
  VendasModel venda;
  ListagemProdutosVenda({super.key, required this.venda});

  @override
  State<ListagemProdutosVenda> createState() => _ListagemProdutosVendaState();
}

class _ListagemProdutosVendaState extends State<ListagemProdutosVenda> {
  final vendasStore = VendasStore();
  String valorPesquisa = "";

  late UseCasesProduto _UseCasesProduto;
  late UseCasesVendas _UseCasesVenda;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _UseCasesProduto = GetIt.I.get<UseCasesProduto>();
    _UseCasesVenda = GetIt.I.get<UseCasesVendas>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                height: 22,
                thickness: 10,
                indent: 140,
                endIndent: 140,
                color: Colors.grey.withOpacity(0.8),
              ),
              _listaDeProdutos(),
            ],
          ),
        ));
  }

  _listaDeProdutos() {
    return SingleChildScrollView(
      child: FutureBuilder<List<ProdutoModel>>(
        future: Future.delayed(const Duration(milliseconds: 200)).then(
            (value) => _UseCasesProduto.obterTodosProdutos(valorPesquisa)),
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
                    return ListTile(
                      //!=== Card ===
                      title: PedidosCard(
                        produto: produtos[index],
                        vendaStore: vendasStore,
                      ),

                      onTap: () {
                        setState(() async {
                          await _UseCasesVenda.criarPedidos(
                              vendaId: widget.venda.id,
                              produtoId: produtos[index].id,
                              quantidadeItens: 1);
                          Navigator.pop(context);
                        });
                      },
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
    );
  }
}
