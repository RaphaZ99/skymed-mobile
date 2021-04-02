import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconeCampo extends StatelessWidget {
  IconeCampo(
      {this.titulo,
      this.icone,
      this.callback,
      this.alinhamento,
      this.margem,
      this.altura,
      this.largura,
      this.tamanhoFonte,
      this.espacamento});

  final String titulo;
  final Icon icone;
  final Function callback;
  final AlignmentGeometry alinhamento;
  final EdgeInsetsGeometry margem;
  final double altura;
  final double largura;
  final double tamanhoFonte;
  final double espacamento;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: this.margem,
      alignment: this.alinhamento,
      height: this.altura,
      width: this.largura,
      child: GestureDetector(
        onTap: callback,
        child: Row(
          children: [
            this.icone,
            SizedBox(width: espacamento ?? 20.0),
            Text(
              this.titulo ?? 'Nome botão',
              style: TextStyle(
                fontSize: this.tamanhoFonte,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
