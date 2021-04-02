import 'package:flutter/material.dart';

class WidgetContainerInputTexto extends StatelessWidget {
  WidgetContainerInputTexto(
      {this.texto,
      this.corDoContainer,
      this.corDaBorda,
      this.alinhamento,
      this.largura,
      this.altura,
      this.margem,
      this.widget,
      this.tamanhoDaLetra,
      this.alturaDoTexto});

  final String texto;
  final Color corDoContainer;
  final Alignment alinhamento;
  final double largura;
  final double altura;
  final double margem;
  final Color corDaBorda;
  final Widget widget;
  final double tamanhoDaLetra;
  final double alturaDoTexto;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: widget ??
            Text(
              texto,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: tamanhoDaLetra,
                  height: alturaDoTexto),
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
