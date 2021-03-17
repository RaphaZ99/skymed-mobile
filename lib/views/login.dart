import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/model/model.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    child: Image.asset(
                      'assets/images/skymed-logo.png',
                      fit: BoxFit.contain,
                    )),
                SizedBox(height: 50.0),
                Model().textFormField('Email'),
                SizedBox(height: 50.0),
                Model().textFormField('Senha'),
                SizedBox(height: 30.0),
                Model().buttonTheme(
                    Colors.black, 'Login', context, Colors.white, Colors.black),
                Model().divider(50.0, Colors.black),
                SizedBox(height: 1.0),
                Model().buttonTheme(Colors.white, 'Login com o Google', context,
                    Colors.black, Colors.lightGreen),
                SizedBox(height: 30.0),
                Model().buttonTheme(Colors.white, 'Login com o Facebook',
                    context, Colors.black, Colors.lightBlue),
                Model().divider(50.0, Colors.black),
                SizedBox(
                  height: 1.0,
                ),
                Model().buttonTheme(Colors.black, 'Cadastrar', context,
                    Colors.white, Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
