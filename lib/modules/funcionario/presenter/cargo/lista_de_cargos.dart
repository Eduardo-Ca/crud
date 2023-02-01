import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:teste/modules/funcionario/data/models/cargo_model.dart';
import 'package:teste/modules/funcionario/domain/usecases/funcionario_usecases.dart';
import 'package:teste/modules/funcionario/presenter/cargo/lista_cargos_card.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class ListaCargosTela extends StatefulWidget {
  const ListaCargosTela({super.key});

  @override
  State<ListaCargosTela> createState() => _ListaCargosTelaState();
}

class _ListaCargosTelaState extends State<ListaCargosTela> {


  late UseCasesFuncionario _UseCasesFuncionario;

  @override
  void initState() {
    super.initState();

    _UseCasesFuncionario = GetIt.I.get<UseCasesFuncionario>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: BotoesDrawer(),
      ),
     
      appBar: AppBar(
        title: const Text("Cargos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
             _listaDeCargos(),
             const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }




   _listaDeCargos() {
    return SingleChildScrollView(
      child: FutureBuilder<List<CargoModel>>(
        future: Future.delayed(const Duration(milliseconds: 400))
            .then((value) => _UseCasesFuncionario.obterTodosCargos()),
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
              final List<CargoModel>? cargos = snapshot.data;
              if (cargos == null || cargos.isEmpty) {
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
                  itemCount: cargos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      //tileColor: const Color.fromARGB(255, 110, 150, 209),
                      //!=== Card ===
                      title: CargoCard(
                        cargo: cargos[index],
                      ),
    
                     
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
