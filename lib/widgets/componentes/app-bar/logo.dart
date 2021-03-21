import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Image.asset(
        'assets/images/skymed-logo.png',
        fit: BoxFit.contain,
        height: 55,
      ),
    );
  }
}
