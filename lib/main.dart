import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: WidgetLogin(),
    );
  }
}

