import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:teste/modules/vendas/data/models/pedidos_model.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/usecases/vendas_usecases.dart';
import 'package:teste/modules/vendas/presenter/listagem_produtos_venda.dart';
import 'package:teste/store/vendas_store.dart';

class FormPedidos extends StatefulWidget {
  VendasModel venda;
  FormPedidos({super.key, required this.venda});

  @override
  State<FormPedidos> createState() => _FormPedidosState();
}

class _FormPedidosState extends State<FormPedidos> {
  final vendasStore = VendasStore();
  String valorPesquisa = "";
  String? dropValueClientes;
  String? dropValueFuncionarios;
  late UseCasesVendas _UseCasesVendas;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _UseCasesVendas = GetIt.I.get<UseCasesVendas>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Colocando Pedidos...'),
                ),
              );

              Navigator.pop(context);
            },
            icon: const Icon(Icons.check, color: Colors.white, size: 32),
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size(55, 55),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Funcionário: ${widget.venda.funcionarioPedido}\nCliente: ${widget.venda.clientePedido}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 620,
            width: 375,
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 470,
                        width: 370,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(color: Colors.red)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(13.0),
                                    child: Text(
                                      "Pedidos:",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        final adicionarProdutoos =
                                            await adicionarProdutos();
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.add))
                                ],
                              ),
                              _listaDeProdutos()
                            ],
                          ),
                        ),
                      ),
                    ),
                    _total(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _total() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: SizedBox(
        width: 170,
        height: 70,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.red,
          child: Center(child: Observer(builder: (_) {
            return Text(
              "Total: R\$${(vendasStore.totalPedido).toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 17, color: Colors.white),
            );
          })),
        ),
      ),
    );
  }

  //te leva para a tela de adcionar produtos
  adicionarProdutos() async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      )),
      context: context,
      builder: (BuildContext context) {
        return ListagemProdutosVenda(
          venda: widget.venda,
        );
        //bottomModal para adicionar produtos
      },
    );
  }

  _listaDeProdutos() {
    return SingleChildScrollView(
      child: FutureBuilder<List<PedidosModel>>(
        future: Future.delayed(const Duration(milliseconds: 200)).then(
            (value) =>
                _UseCasesVendas.obterTodosPedidos(vendaId: widget.venda.id)),
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
              final List<PedidosModel>? pedidos = snapshot.data;
              vendasStore.totalPedido = 0;
              pedidos!.forEach((i) {
                vendasStore.totalPedido += i.valorPedido;
              });
              if (pedidos == null || pedidos.isEmpty) {
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
                  itemCount: pedidos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      //!=== Card ===
                      title: Card(
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pedidos[index].produtoPedido,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    "Preço: ${pedidos[index].valorUnidade}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    _UseCasesVendas.deletarPedidos(
                                        id: pedidos[index].id);
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 22,
                                  ))
                            ],
                          ),
                        ),
                      ),

                      onTap: () {},
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
