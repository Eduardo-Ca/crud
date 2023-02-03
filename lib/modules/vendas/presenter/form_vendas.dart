import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/vendas/domain/usecases/vendas_usecases.dart';

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

  final _formkey = GlobalKey<FormState>();

  late UseCasesVendas _UseCasesVenda;

  @override
  void initState() {
    super.initState();

    _UseCasesVenda = GetIt.I.get<UseCasesVendas>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Venda'),
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
                      SizedBox(
                        height: 30,
                      ),
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
                      SizedBox(
                        height: 30,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          if (dropValueClientes != null &&
                              dropValueFuncionarios != null) {
                            _UseCasesVenda.criarVendas(
                                clienteId: int.parse(dropValueClientes!),
                                funcionarioId:
                                    int.parse(dropValueFuncionarios!),
                                valorCompra: 0);
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando nova venda'),
                              ),
                            );
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Não deixe os campos vazios!'),
                              ),
                            );
                          }
                         
                        },
                        child: const Text('Adicionar'),
                      ),
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
}
