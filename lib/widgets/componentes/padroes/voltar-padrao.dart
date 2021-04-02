import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';

class BotaoVoltarPadrao extends StatelessWidget {
  BotaoVoltarPadrao({this.margem});

  final EdgeInsetsGeometry margem;

  @override
  Widget build(BuildContext context) {
    return Botao(
      titulo: 'Voltar',
      margem: this.margem ??
          EdgeInsets.only(
            top: 15,
          ),
      corBorda: Colors.red,
      corInterna: Colors.white,
      corLetra: Colors.black,
      callback: () => {Navigator.pop(context)},
    );
  }
}
