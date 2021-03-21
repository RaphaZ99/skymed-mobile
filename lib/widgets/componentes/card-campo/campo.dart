import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Campo extends StatelessWidget {
  Campo({this.titulo, this.ehSenha, this.margem});

  final String titulo;
  final bool ehSenha;
  final EdgeInsets margem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: TextField(
          obscureText: ehSenha ?? false,
          decoration: InputDecoration(
            labelText: titulo,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
      margin: margem,
      elevation: 0,
    );
  }
}
