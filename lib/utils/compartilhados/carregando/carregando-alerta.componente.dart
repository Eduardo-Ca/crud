import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:teste/utils/compartilhados/carregando/carregando.componente.dart';


class CarregandoAlertaComponente {
  showCarregar(BuildContext context,
      {bool exibirTexto = true, String? mensagemCarregamento}) {
    if (!Platform.isIOS || !Platform.isMacOS) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Carregando(size: 30),
                Visibility(
                  visible: exibirTexto,
                  child: Text("${mensagemCarregamento ?? Carregando}"),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Carregando(size: 30),
                Visibility(
                  visible: exibirTexto,
                  child: Text("${mensagemCarregamento ?? Carregando}"),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  showCarregarSemTexto(BuildContext context) {
    if (!Platform.isIOS || !Platform.isMacOS) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Carregando(size: 30),
              ],
            ),
          ),
        ),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Carregando(size: 30),
              ],
            ),
          ),
        ),
      );
    }
  }

  dismissCarregar(BuildContext context) {
    Navigator.of(context).pop();
  }
}
