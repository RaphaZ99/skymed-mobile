import 'package:flutter/material.dart';

class WidgetContainerRetangularTextField extends StatelessWidget {
  WidgetContainerRetangularTextField(
      {this.texto,
      this.corDoContainer,
      this.corDaBorda,
      this.alinhamento,
      this.largura,
      this.altura,
      this.margem});

  final String texto;
  final Color corDoContainer;
  final Alignment alinhamento;
  final double largura;
  final double altura;
  final double margem;
  final Color corDaBorda;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, height: 2.0),
        ),
      ),
      alignment: alinhamento ?? Alignment.topCenter,
      width: largura ?? 10,
      height: altura ?? 71,
      decoration: BoxDecoration(
        color: corDoContainer ?? Colors.white,
        border: Border.all(color: corDaBorda ?? Colors.black),
      ),
      margin: EdgeInsets.only(top: margem ?? 30),
    );
  }
}
