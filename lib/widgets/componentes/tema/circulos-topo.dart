import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirculosTopo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Align(
          alignment: Alignment(-1.3, -1.0),
          child: new Container(
            width: 120.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment(-1.0, -1.15),
          child: new Container(
            width: 120.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
