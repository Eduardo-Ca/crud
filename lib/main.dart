import 'package:flutter/material.dart';
import 'package:teste/modules/cliente/presenter/lista_clientes_tela.dart';
import 'package:teste/utils/compartilhados/service_locator.dart';
import 'package:teste/utils/constants/tema_constante.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: temaClaro,
        darkTheme: temaEscuro,
        home: const ListaCleintesTela());
  }
}
