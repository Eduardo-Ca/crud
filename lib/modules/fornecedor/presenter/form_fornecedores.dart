import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste/modules/fornecedor/domain/usecases/fornecedor_usecases.dart';
import 'package:teste/modules/fornecedor/presenter/components/text_form_fornecedores.dart';

class FormFornecedores extends StatefulWidget {
  const FormFornecedores({super.key});

  @override
  State<FormFornecedores> createState() => _FormFornecedoresState();
}

class _FormFornecedoresState extends State<FormFornecedores> {
  TextEditingController nameController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();

  late UseCasesFornecedor _UseCasesFornecedor;

  @override
  void initState() {
    super.initState();

    _UseCasesFornecedor = GetIt.I.get<UseCasesFornecedor>();
  }

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
          title: const Text('Novo Fornecedor'),
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
                      TextFormFornecedores(
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
                      TextFormFornecedores(
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
                      TextFormFornecedores(
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
                      TextFormFornecedores(
                        teclado: TextInputType.name,
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira o CNPJ';
                          }
                          return null;
                        },
                        controller: cnpjController,
                        hintText: "CNPJ",
                      ),

                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _UseCasesFornecedor.criarFornecedor(
                                nome: nameController.text,
                                telefone: telefoneController.text,
                                endereco: enderecoController.text,
                                cnpj: cnpjController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando novo Fornecedor...'),
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
