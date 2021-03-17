import 'package:flutter/material.dart';

class Model {
  TextStyle style = TextStyle(fontFamily: 'Souliyo-Regular', fontSize: 20.0);

  TextFormField textFormField(labeltext) {
    return TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        labelText: labeltext,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  ButtonTheme buttonTheme(color, textButton, context, colorText, borderColor) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: color,
        child: Text(textButton,
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: colorText, fontWeight: FontWeight.bold)),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: borderColor),
        ),
      ),
    );
  }

  Divider divider(height, color) {
    return Divider(
      height: height,
      indent: 0,
      color: color,
      thickness: 1,
    );
  }
}
