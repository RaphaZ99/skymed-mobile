import 'package:flutter/material.dart';
import 'package:skymed_mobile/provider/base_http.dart';
import 'package:skymed_mobile/views/listagem-medicos.dart';
import 'package:skymed_mobile/views/login.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseHttp.estaLogado() ? WidgetListagemMedicos() : WidgetLogin();
  }
}
