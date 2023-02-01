import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';
import 'package:teste/modules/funcionario/domain/usecases/funcionario_usecases.dart';
import 'package:teste/modules/funcionario/presenter/components/text_form_funcionarios.dart';

class EdicaoFuncionarios extends StatefulWidget {
  FuncionarioModel funcionario;
  List<CargoModel> dropCargo;
   EdicaoFuncionarios({super.key, required this.funcionario, required this.dropCargo});

  @override
  State<EdicaoFuncionarios> createState() => _EdicaoFuncionariosState();
}

class _EdicaoFuncionariosState extends State<EdicaoFuncionarios> {
  TextEditingController nameController = TextEditingController();
 TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
   TextEditingController cargoController = TextEditingController();

      String? dropValueCargo;

  final _formkey = GlobalKey<FormState>();

   late UseCasesFuncionario _UseCasesFuncionario;

  @override
  void initState() {
    super.initState();

    _UseCasesFuncionario = GetIt.I.get<UseCasesFuncionario>();
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
          title:  Text('Editando:${widget.funcionario.nome}'),
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
                        funcao: (String? value) {
                          if (nomeValidator(value)) {
                            return 'Insira o CPF';
                          }
                          return null;
                        },
                        controller: cpfController,
                        hintText: "CPF",
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
                              value: dropValueCargo,
                              items: widget.dropCargo
                                  .map((opcao) => DropdownMenuItem(
                                      value: opcao.id, child: Text(opcao.nome)))
                                  .toList(),
                              onChanged: (escolha) =>
                                  dropValueCargo = escolha.toString()),
                        ),
                      ),


                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                             _UseCasesFuncionario.editarFuncionario(nome:nameController.text,
                              telefone:telefoneController.text,
                               endereco:enderecoController.text,
                               cargo:int.parse(dropValueCargo!),
                               cpf:cpfController.text,
                               id:widget.funcionario.id);
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
