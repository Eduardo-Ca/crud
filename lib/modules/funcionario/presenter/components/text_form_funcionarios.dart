import 'package:flutter/material.dart';

class TextFormVendas extends StatefulWidget {
  String? Function(String?)? funcao;
  TextEditingController controller;
  String hintText;
  TextInputType? teclado;

   TextFormVendas({super.key,required this.funcao,required this.controller, required this.hintText, required this.teclado});

  @override
  State<TextFormVendas> createState() => _TextFormVendasState();
}

class _TextFormVendasState extends State<TextFormVendas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: TextFormField(
        keyboardType: widget.teclado,
        validator:widget.funcao,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: widget.hintText,
          fillColor: Colors.white60,
          filled: true,
        ),
      ),
    ); //nome;
  }
}



 