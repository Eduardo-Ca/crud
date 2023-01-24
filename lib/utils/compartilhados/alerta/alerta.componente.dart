// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertaComponente {
  Future showAlerta({
    required BuildContext context,
    String mensagem = '',
    String titulo = '',
    required List<Widget> acoes,
    bool barrierDismissible = false,
    Widget? conteudo,
    double? height,
  }) {
    if (!Platform.isIOS || !Platform.isMacOS) {
      return showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => AlertDialog(
          title: Text(titulo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              conteudo ?? Text(mensagem),
            ],
          ),
          actions: acoes,
        ),
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
            title: Text(titulo),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                conteudo ?? Container(child: Text(mensagem)),
              ],
            ),
            actions: acoes),
      );
    }
  }

  Future<bool> showAlertaConfirmacao(
      {required BuildContext context, required String mensagem}) async {
    return await showAlerta(
        context: context,
        mensagem: mensagem,
        titulo: "Aviso",
        barrierDismissible: true,
        acoes: [
          ElevatedButton(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          ElevatedButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ]);
  }

  Future<bool?> showAlertaErro(
      {required BuildContext context,
      required String mensagem,
      bool localedMessage = false}) async {
    return await showAlerta(
        context: context,
        titulo: "Aviso",
        mensagem: localedMessage ? mensagem : mensagem,
        barrierDismissible: true,
        acoes: [
          ElevatedButton(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]);
  }

  Future<bool> showAlertaErros(
      {required BuildContext context, required List<String> erros}) async {
    return await showAlerta(
        context: context,
        titulo: "Erro",
        conteudo: SizedBox(
          height: 200,
          width: double.maxFinite,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: erros.length,
              itemBuilder: (context, index) {
                return Text(erros[index]);
              },
            ),
          ),
        ),
        barrierDismissible: true,
        acoes: [
          ElevatedButton(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]);
  }

  Future<bool?> showAlertaStatusOSExecucao(
      {required BuildContext context, required List<String> erros}) async {
    double height = (erros.length.toDouble() * 75) <= 200
        ? (erros.length.toDouble() * 75)
        : 200;
    return await showAlerta(
        context: context,
        titulo: "Erro",
        conteudo: Container(
          height: height,
          width: double.maxFinite,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: erros.length,
              itemBuilder: (context, index) {
                return Text(erros[index]);
              },
            ),
          ),
        ),
        barrierDismissible: true,
        acoes: [
          ElevatedButton(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]);
  }
}
