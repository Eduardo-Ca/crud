import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste/modules/cliente/data/models/cliente_model.dart';
import 'package:teste/modules/cliente/domain/entities/cliente_entity.dart';
import 'package:teste/modules/cliente/domain/usecases/cliente_usecases.dart';
import 'package:teste/modules/cliente/presenter/components/text_form_clientes.dart';

class EdicaoCliente extends StatefulWidget {
  ClienteModel cliente;
  EdicaoCliente({super.key, required this.cliente});

  @override
  State<EdicaoCliente> createState() => _EdicaoClienteState();
}

class _EdicaoClienteState extends State<EdicaoCliente> {
  TextEditingController nameController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
    TextEditingController cpfController = TextEditingController();

  late UseCasesCliente _UseCasesCliente;

  @override
  void initState() {
    super.initState();

    _UseCasesCliente = GetIt.I.get<UseCasesCliente>();
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
          title: Text("Edição:${widget.cliente.nome}"),
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
                        TextFormClientes(
                        teclado: TextInputType.number,
                        funcao: (String? value) {
                          if (nomeValidator(value)) {
                            return 'Insira o CPF';
                          }
                          return null;
                        },
                        controller: cpfController,
                        hintText: "CPF",
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _UseCasesCliente.editarCliente(
                                nome: nameController.text,
                                telefone: telefoneController.text,
                                endereco: enderecoController.text,
                                cpf: cpfController.text,
                                id: widget.cliente.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Editando Cliente...'),
                              ),
                            );
                            //print("nome: ${nameController.text}");

                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Editar'),
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
