import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Divisor extends StatelessWidget {
  Divisor({this.altura, this.cor});

  final double altura;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: altura ?? 80.0,
      indent: 0,
      color: cor ?? Colors.black,
      thickness: 1,
    );
  }
}
