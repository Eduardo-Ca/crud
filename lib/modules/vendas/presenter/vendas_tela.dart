import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/usecases/funcionario_usecases.dart';
import 'package:teste/modules/vendas/data/models/vendas_model.dart';
import 'package:teste/modules/vendas/domain/entities/vendas_entity.dart';
import 'package:teste/modules/vendas/domain/usecases/vendas_usecases.dart';
import 'package:teste/modules/vendas/presenter/components/lista_vendas_card.dart';
import 'package:teste/modules/vendas/presenter/form_pedidos.dart';
import 'package:teste/modules/vendas/presenter/form_vendas.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class VendasTela extends StatefulWidget {
  const VendasTela({super.key});

  @override
  State<VendasTela> createState() => _VendasTelaState();
}

class _VendasTelaState extends State<VendasTela> {
  
  String valorPesquisa = "";
  List<ClienteModel> dropClientes = [];
  List<FuncionarioModel> dropFuncionarios = [];
  late UseCasesVendas _UseCasesVendas;
  late UseCasesFuncionario _useCasesFuncionario;
  late UseCasesCliente _useCasesCliente;

  @override
  void initState() {
    super.initState();
    _useCasesFuncionario = GetIt.I.get<UseCasesFuncionario>();
    _useCasesCliente = GetIt.I.get<UseCasesCliente>();
    _UseCasesVendas = GetIt.I.get<UseCasesVendas>();

    dropLists();
  }

  dropListFuncionario() async {
    final List<FuncionarioModel> dropFuncionarios =
        await _useCasesFuncionario.obterTodosFuncionarios(valorPesquisa);
    return dropFuncionarios;
  }

  dropListCliente() async {
    final List<ClienteModel> dropClientes =
        await _useCasesCliente.obterTodosClientes();

    return dropClientes;
  }

  dropLists() async {
    dropClientes = await dropListCliente();
    dropFuncionarios = await dropListFuncionario();
  }

  bool chip1Selecionado = true;
  bool chip2Selecionado = false;
  bool chip3Selecionado = false;
  bool chip4Selecionado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: BotoesDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Vendas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         final novaVenda = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormVendas(
                        dropClientes: dropClientes,
                        dropFuncionarios: dropFuncionarios,
                      )));
                setState(() {
                  
                });
        },
        child: const Icon(
          MdiIcons.cashPlus,
          size: 28,
          color: Colors.white,
        ),
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                _chips(),
                const Divider(
                  thickness: 2,
                ),
              ],
            )),
        listaDeVendas(),
      ]),
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

  listaDeVendas() {
    return SingleChildScrollView(
      child: FutureBuilder<List<VendasModel>>(
        future: Future.delayed(const Duration(milliseconds: 400))
            .then((value) => chip1Selecionado
                ? _UseCasesVendas.obterTodasVendas()
                : chip2Selecionado
                    ? _UseCasesVendas.obterVendaPorDia(1)
                    : chip3Selecionado
                        ? _UseCasesVendas.obterVendaPorDia(5)
                        : _UseCasesVendas.obterVendaPorDia(10)),
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
              final List<VendasModel>? vendas = snapshot.data;
              if (vendas == null || vendas.isEmpty) {
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
                  itemCount: vendas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        background: Container(
                          color: Colors.red,
                        ),
                        key: ValueKey<Vendas>(vendas[index]),
                        onDismissed: (DismissDirection direction) async {
                          setState(() {
                             _UseCasesVendas.deletarVendas(
                                 id: vendas[index].id);
                          });
                        },
                        child: ListTile(
                          //tileColor: const Color.fromARGB(255, 110, 150, 209),
                          //!=== Card ===
                          title: VendaCard(
                            venda: vendas[index],
                          ),

                          onTap: (() async {
                            final editarProduto = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contextNew) => FormPedidos(
                                          venda: vendas[index],
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
