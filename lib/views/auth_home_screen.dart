import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/listagem-medicos.dart';
import 'package:skymed_mobile/views/login.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Pacientes auth = Provider.of(context);
    return auth.isAutenticado ? WidgetListagemMedicos() : WidgetLogin();
  }
}
