import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/usecases/funcionario_usecases.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/entities/produto_entity.dart';
import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';
import 'package:teste/modules/produto/presenter/components/lista_produtos_card.dart';

class FormVendas extends StatefulWidget {
  List<ClienteModel> dropClientes;
  List<FuncionarioModel> dropFuncionarios;

  FormVendas(
      {super.key, required this.dropClientes, required this.dropFuncionarios});

  @override
  State<FormVendas> createState() => _FormVendasState();
}

class _FormVendasState extends State<FormVendas> {
  String valorPesquisa = "";
  String? dropValueClientes;
  String? dropValueFuncionarios;
  late UseCasesProduto _UseCasesProduto;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _UseCasesProduto = GetIt.I.get<UseCasesProduto>();
  }

  bool nomeValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Venda'),
          actions: [
            IconButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Criando nova venda...'),
                    ),
                  );

                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.check, color: Colors.white, size: 32),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 650,
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
                      //! ============== TEXT FORMS ===========

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: "Escolha o cliente",
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                              ),
                              isExpanded: true,
                              icon: const Icon(Icons.people),
                              value: dropValueClientes,
                              items: widget.dropClientes
                                  .map((opcao) => DropdownMenuItem(
                                      value: opcao.id, child: Text(opcao.nome)))
                                  .toList(),
                              onChanged: (escolha) =>
                                  dropValueClientes = escolha.toString()),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: "Escolha o funcionário",
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                              ),
                              isExpanded: true,
                              icon: const Icon(MdiIcons.briefcase),
                              value: dropValueFuncionarios,
                              items: widget.dropFuncionarios
                                  .map((opcao) => DropdownMenuItem(
                                      value: opcao.id, child: Text(opcao.nome)))
                                  .toList(),
                              onChanged: (escolha) =>
                                  dropValueFuncionarios = escolha.toString()),
                        ),
                      ),

                      const Divider(
                        thickness: 3,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 330,
                          width: 370,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(0.2),
                              border: Border.all(color: Colors.red)),
                          child: SingleChildScrollView(
                            child: Column(
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
                                _listaDeProdutos(),
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
          child: const Center(
              child: Text(
            "Total: R\$0,00",
            style: TextStyle(fontSize: 17, color: Colors.white),
          )),
        ),
      ),
    );
  }

  _listaDeProdutos() {
    return SingleChildScrollView(
      child: FutureBuilder<List<ProdutoModel>>(
        future: Future.delayed(const Duration(milliseconds: 400)).then(
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
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(produtos[index].nome),
                              Text("Preço: ${produtos[index].precoUnitario}",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            ],
                          ),
                          const Icon(Icons.add_box)
                        ],
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
