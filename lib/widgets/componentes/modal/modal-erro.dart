import 'package:flutter/material.dart';

class ModalErro extends StatelessWidget {
  final String texto;

  ModalErro(this.texto);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Erro!',
        textAlign: TextAlign.center,
      ),
      children: [
        Text(
          this.texto,
          textAlign: TextAlign.center,
        ),
      ],
      contentPadding: EdgeInsets.all(15.0),
    );
  }
}
