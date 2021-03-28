import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoFiltro extends StatelessWidget {
  BotaoFiltro({this.titulo, this.icone, this.callback});

  final String titulo;
  final Icon icone;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    Color getColorBackground(Set<MaterialState> states) {
      return Colors.white;
    }

    Color getColorShadow(Set<MaterialState> states) {
      return Colors.black;
    }

    Color getFontColor(Set<MaterialState> states) {
      return Colors.black;
    }

    RoundedRectangleBorder getShape(Set<MaterialState> states) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide(
          color: Colors.black,
        ),
      );
    }

    EdgeInsets getEdge(Set<MaterialState> states) {
      return EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      );
    }

    return TextButton(
      child: Row(
        children: [
          icone ?? Icon(Icons.add),
          Text(titulo),
        ],
      ),
      onPressed: this.callback,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1.0),
        shadowColor: MaterialStateProperty.resolveWith(getColorShadow),
        backgroundColor: MaterialStateProperty.resolveWith(getColorBackground),
        foregroundColor: MaterialStateProperty.resolveWith(getFontColor),
        shape: MaterialStateProperty.resolveWith(getShape),
        padding: MaterialStateProperty.resolveWith(getEdge),
      ),
    );
  }
}
