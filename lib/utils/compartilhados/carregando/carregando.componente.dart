import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Carregando extends StatelessWidget {
  final double size;
  final String? texto;
  const Carregando({super.key, this.size = 25, this.texto});
  @override
  Widget build(BuildContext context) {
    if (texto == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitWave(
              color: Theme.of(context).indicatorColor,
              size: size,
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitWave(
              color: Theme.of(context).indicatorColor,
              size: size,
            ),
            Text(texto!),
          ],
        ),
      );
    }
  }
}

class CarregandoStateLess extends StatefulWidget {
  final double size;

  const CarregandoStateLess({Key? key, this.size = 25}) : super(key: key);

  @override
  CarregandoStateLessState createState() => CarregandoStateLessState();
}

class CarregandoStateLessState extends State<CarregandoStateLess> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return AlertDialog(
      content: Builder(builder: (context) {
        return SizedBox(
          height: media.size.height * 0.15,
          width: media.size.height * 0.3,
          child: SpinKitWave(
            color: Theme.of(context).indicatorColor,
            size: (media.size.height * 0.05),
          ),
        );
      }),
    );
  }

  dismissCarregar() {
    Navigator.of(context).pop();
  }
}

class CarregandoBody extends StatelessWidget {
  final double size;
  final BoxConstraints? constraints;
  final String? texto;

  /// Esse é o método mais adequado para uso de Carregamento. Eventualmente será implementado no sistema todo
  const CarregandoBody(
      {super.key, this.size = 25, this.constraints, this.texto});

  @override
  Widget build(BuildContext context) {
    if (texto == null) {
      return Container(
        constraints: BoxConstraints(minHeight: constraints?.maxHeight ?? 100),
        child: Center(
          child: SpinKitWave(
            color: Theme.of(context).indicatorColor,
            size: size,
          ),
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(minHeight: constraints?.maxHeight ?? 100),
        child: Center(
          child: Column(
            children: [
              SpinKitWave(
                color: Theme.of(context).indicatorColor,
                size: size,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
                child: Text(texto!),
              )
            ],
          ),
        ),
      );
    }
  }
}
