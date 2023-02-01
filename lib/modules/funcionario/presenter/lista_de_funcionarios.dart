import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/data/models/funcionario_model.dart';
import 'package:teste/modules/funcionario/domain/entities/funcionario_entity.dart';
import 'package:teste/modules/funcionario/domain/usecases/funcionario_usecases.dart';
import 'package:teste/modules/funcionario/presenter/edicao_funcionarios.dart';
import 'package:teste/modules/funcionario/presenter/form_funcionarios.dart';
import 'package:teste/modules/funcionario/presenter/components/lista_funcionarios_card.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaFuncionariosTela extends StatefulWidget {
  const ListaFuncionariosTela({super.key});

  @override
  State<ListaFuncionariosTela> createState() => _ListaFuncionariosTelaState();
}

class _ListaFuncionariosTelaState extends State<ListaFuncionariosTela> {
  String valorPesquisa = "";
  Timer? _debounce;
   List<CargoModel> dropCargo = [];

  late UseCasesFuncionario _UseCasesFuncionario;

  @override
  void initState() {
    super.initState();

    _UseCasesFuncionario = GetIt.I.get<UseCasesFuncionario>();
    dropLists();
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  dropListCargo() async {
    final List<CargoModel> dropFuncionarios =
        await _UseCasesFuncionario.obterTodosCargos();
    return dropFuncionarios;
  }

  dropLists() async {
  
    dropCargo = await dropListCargo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: BotoesDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         final criarFuncionario = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) =>  FormFuncionarios(dropCargo: dropCargo,)));
          setState(() {
            
          });
        },
        child: const Icon(
          MdiIcons.briefcasePlus,
          size: 28,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Funcionários"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _barraDePesquisa(),
            const Divider(
              thickness: 2,
            ),
      
             _listaDeFuncionarios(),
             const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }

  // função para na hora da pesquisa esperar um tempo antes de fazer varias requisições para api
  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(
        () {
           valorPesquisa = value;
        },
      );
    });
  }

  _barraDePesquisa() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onChanged: (value) => {_onSearchChanged(value)},
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {});
            },
          ),
          hintText: 'Procurar',
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }

   _listaDeFuncionarios() {
    return SingleChildScrollView(
      child: FutureBuilder<List<FuncionarioModel>>(
        future: Future.delayed(const Duration(milliseconds: 400))
            .then((value) => _UseCasesFuncionario.obterTodosFuncionarios( valorPesquisa)),
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
              final List<FuncionarioModel>? funcionarios = snapshot.data;
              if (funcionarios == null || funcionarios.isEmpty) {
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
                  itemCount: funcionarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        background: Container(
                          color: Colors.red,
                        ),
                        key: ValueKey<Funcionario>(funcionarios[index]),
                        onDismissed: (DismissDirection direction) async {
                          setState(() {
                            _UseCasesFuncionario.deletarFuncionario(
                                id: funcionarios[index].id);
                          });
                        },
                        child: ListTile(
                          //tileColor: const Color.fromARGB(255, 110, 150, 209),
                          //!=== Card ===
                          title: FuncionarioCard(
                            funcionario: funcionarios[index],
                          ),
    
                          onTap: (() async {
                            final editarFuncionario = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contextNew) => EdicaoFuncionarios(
                                          funcionario: funcionarios[index],dropCargo: dropCargo
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
