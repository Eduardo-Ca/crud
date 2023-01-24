import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/cliente/presenter/components/text_form_clientes.dart';
import 'package:teste/modules/funcionario/presenter/components/text_form_funcionarios.dart';
import 'package:teste/modules/produto/presenter/components/text_form_produtos.dart';

class FormVendas extends StatefulWidget {
  const FormVendas({super.key});

  @override
  State<FormVendas> createState() => _FormVendasState();
}

class _FormVendasState extends State<FormVendas> {
  final dropValueClientes = ValueNotifier('');
  final dropValueFuncionarios = ValueNotifier('');
  final dropClientes = ['Eduardo', 'Marcos'];
  final dropFuncionarios = ['Gustavo', 'Julio'];

  final _formkey = GlobalKey<FormState>();

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
          title: const Text('Novo Venda'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
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
                        child: ValueListenableBuilder(
                          valueListenable: dropValueClientes,
                          builder: (BuildContext context, String value, _) {
                            return SizedBox(
                              width: 350,
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: "Escolha o cliente",
                                    fillColor: Colors.white60,
                                    filled: true,
                                  ),
                                  //! validator pra n vir nulo
                                  isExpanded: true,
                                  icon: const Icon(Icons.people),
                                  value: (value.isEmpty) ? null : value,
                                  items: dropClientes
                                      .map((opcao) => DropdownMenuItem(
                                          value: opcao, child: Text(opcao)))
                                      .toList(),
                                  onChanged: (escolha) => dropValueClientes
                                      .value = escolha.toString()),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ValueListenableBuilder(
                          valueListenable: dropValueFuncionarios,
                          builder: (BuildContext context, String value, _) {
                            return SizedBox(
                              width: 350,
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: "Escolha o funcionário",
                                    fillColor: Colors.white60,
                                    filled: true,
                                  ),
                                  //! validator pra n vir nulo
                                  isExpanded: true,
                                  icon: const Icon(
                                    MdiIcons.briefcase,
                                  ),
                                  value: (value.isEmpty) ? null : value,
                                  items: dropFuncionarios
                                      .map((opcao) => DropdownMenuItem(
                                          value: opcao, child: Text(opcao)))
                                      .toList(),
                                  onChanged: (escolha) => dropValueFuncionarios
                                      .value = escolha.toString()),
                            );
                          },
                        ),
                      ),

                      const Divider(
                        thickness: 3,
                      ),

                      //! Lista de produtos
                      Container(
                        height: 330,
                        width: 370,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color: Colors.brown[100],
                            border: Border.all(color: Colors.red)),
                            
                        child: Column(
                          children: [
                            //! ===================== TOTAL ======================
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 180.0, top: 260),
                              child: SizedBox(
                                width: 140,
                                height: 60,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.red,
                                  child: const Center(
                                      child: Text(
                                    "Total: R\$0,00",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //!========== ADICIONAR =========
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
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
