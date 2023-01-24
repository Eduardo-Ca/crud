import 'package:flutter/material.dart';

class TextFormFornecedores extends StatefulWidget {
  String? Function(String?)? funcao;
  TextEditingController controller;
  String hintText;
  TextInputType? teclado;
   TextFormFornecedores({super.key,required this.funcao,required this.controller, required this.hintText,required this.teclado});

  @override
  State<TextFormFornecedores> createState() => _TextFormFornecedoresState();
}

class _TextFormFornecedoresState extends State<TextFormFornecedores> {
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



 