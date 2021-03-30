import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  Botao(
      {this.titulo,
      this.corBorda,
      this.corInterna,
      this.corLetra,
      this.margem,
      this.callback,
      this.width,
      this.icone});

  final String titulo;
  final Color corBorda;
  final Color corInterna;
  final Color corLetra;
  final EdgeInsets margem;
  final Function callback;
  final double width;
  final Widget icone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margem ??
          EdgeInsets.only(
            top: 30,
          ),
      child: FractionallySizedBox(
        widthFactor: width ?? 0.85,
        child: ButtonTheme(
          padding: EdgeInsets.all(10.0),
          // ignore: deprecated_member_use
          child: FlatButton(
            color: corInterna ?? Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                icone ?? Text(''),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Souliyo-Regular',
                    fontSize: 20.0,
                    color: corLetra ?? Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            onPressed: callback,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
              side: BorderSide(
                color: corBorda ?? Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
