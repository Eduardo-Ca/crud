import 'package:flutter/material.dart';
import 'package:teste/modules/funcionario/presenter/components/text_form_funcionarios.dart';

class FormFuncionarios extends StatefulWidget {
  const FormFuncionarios({super.key});

  @override
  State<FormFuncionarios> createState() => _FormFuncionariosState();
}

class _FormFuncionariosState extends State<FormFuncionarios> {
  TextEditingController nameController = TextEditingController();
 TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
   TextEditingController cargoController = TextEditingController();

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
          title: const Text('Novo Funcionário'),
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
                       TextFormVendas(
                        teclado: TextInputType.name,
                        funcao: (String? value) {
                          if (nomeValidator(value)) {
                            return 'Insira o nome';
                          }
                          return null;
                        },
                        controller: nameController,
                        hintText: "Nome",
                      ),
                      TextFormVendas(
                        teclado: TextInputType.name,
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira o telefone';
                          }
                          return null;
                        },
                        controller: telefoneController,
                        hintText: "Telefone",
                      ),

                       TextFormVendas(
                        teclado: TextInputType.name,
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira o endereço';
                          }
                          return null;
                        },
                        controller: enderecoController,
                        hintText: "Endereço",
                      ),
                     
                      TextFormVendas(
                        teclado: TextInputType.number,
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira o cargo';
                          }
                          return null;
                        },
                        controller: cargoController,
                        hintText: "Cargo",
                      ),

                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando novo Funcionário...'),
                              ),
                            );
                            print(nameController.text);
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
