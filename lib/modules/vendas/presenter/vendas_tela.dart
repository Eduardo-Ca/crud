import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/vendas/presenter/components/form_vendas.dart';
import 'package:teste/utils/compartilhados/botoes_drawer.dart';

class VendasTela extends StatefulWidget {
  const VendasTela({super.key});

  @override
  State<VendasTela> createState() => _VendasTelaState();
}

class _VendasTelaState extends State<VendasTela> {
  bool chip1Selecionado = false;
  bool chip2Selecionado = false;
  bool chip3Selecionado = false;
  bool chip4Selecionado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: BotoesDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Vendas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (contextNew) => const FormVendas()));
        },
        child: const Icon(
          MdiIcons.cashPlus,
          size: 28,
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ChoiceChip(
                    backgroundColor: Colors.grey[700],
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Hoje",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    selected: chip1Selecionado,
                    selectedColor: Colors.red,
                    onSelected: (newState) {
                      setState(() {
                        chip1Selecionado = newState;
                        chip2Selecionado = false;
                        chip3Selecionado = false;
                        chip4Selecionado = false;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ChoiceChip(
                    backgroundColor: Colors.grey[700],
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Ontem",
                          style: TextStyle(color: Colors.white)),
                    ),
                    selected: chip2Selecionado,
                    selectedColor: Colors.red,
                    onSelected: (newState) {
                      setState(() {
                        chip2Selecionado = newState;
                        chip4Selecionado = false;
                        chip3Selecionado = false;
                        chip1Selecionado = false;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ChoiceChip(
                    backgroundColor: Colors.grey[700],
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Há 5 dias",
                          style: TextStyle(color: Colors.white)),
                    ),
                    selected: chip3Selecionado,
                    selectedColor: Colors.red,
                    onSelected: (newState) {
                      setState(() {
                        chip3Selecionado = newState;
                        chip1Selecionado = false;
                        chip2Selecionado = false;
                        chip4Selecionado = false;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: ChoiceChip(
                    backgroundColor: Colors.grey[700],
                    label: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("Há 10 dias",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    
                    selected: chip4Selecionado,
                    selectedColor: Colors.red,
                    onSelected: (newState) {
                      setState(() {
                        chip4Selecionado = newState;
                        chip3Selecionado = false;
                        chip2Selecionado = false;
                        chip1Selecionado = false;
                      });
                    }),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
