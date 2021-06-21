import 'package:flutter/material.dart';

class ModalSucesso extends StatelessWidget {
  final String texto;

  ModalSucesso(this.texto);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Sucesso!',
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
