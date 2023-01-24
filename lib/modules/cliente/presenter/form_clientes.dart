import 'package:flutter/material.dart';
import 'package:teste/modules/cliente/presenter/components/text_form_clientes.dart';

class FormCientes extends StatefulWidget {
  const FormCientes({super.key});
  

  @override
  State<FormCientes> createState() => _FormCientesState();
}

class _FormCientesState extends State<FormCientes> {
  TextEditingController nameController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
    TextEditingController enderecoController = TextEditingController();

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
          title: const Text('Novo Cliente'),
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
                      TextFormClientes(
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
                      TextFormClientes(
                        teclado: TextInputType.number,
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira o telefone';
                          }
                          return null;
                        },
                        controller: telefoneController,
                        hintText: "Telefone",
                      ),
                      TextFormClientes(
                         teclado: TextInputType.streetAddress,
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira o endereço';
                          }
                          return null;
                        },
                        controller: enderecoController,
                        hintText: "Endereço",
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando novo Cliente...'),
                              ),
                            );
                            //print("nome: ${nameController.text}");
                          
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
