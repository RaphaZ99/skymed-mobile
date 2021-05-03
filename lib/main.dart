import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/cadastro-paciente-form-fim.dart';
import 'package:skymed_mobile/views/cadastro_paciente_form_inicio.dart';
import 'package:skymed_mobile/views/edicao-paciente-dados.dart';
import 'package:skymed_mobile/views/edicao-paciente-endereco.dart';
import 'package:skymed_mobile/views/historico-consultas.dart';
import 'package:skymed_mobile/views/listagem-medicos.dart';
import 'package:skymed_mobile/views/login.dart';
import 'package:skymed_mobile/views/menu-usuario.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-codigo.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-informar-email.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-nova-senha.dart';

import 'routes/app_routes.dart';

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
      initialRoute: AppRoutes.LOGIN,
      routes: {
        AppRoutes.MENU_USUARIO: (context) => WidgetMenuUsuario(),
        AppRoutes.RECUPERAR_SENHA_PACIENTE_CODIGO: (context) =>
            WidgetRecuperarSenhaPacienteCodigo(),
        AppRoutes.RECUPERAR_SENHA_PACIENTE_EMAIL: (context) =>
            WidgetRecuperarSenhaPacienteIformarEmail(),
        AppRoutes.RECUPERAR_SENHA_PACIENTE_NOVA_SENHA: (context) =>
            WidgetRecuperarSenhaPacienteNovaSenha(),
        AppRoutes.CADASTRO_PACIENTE_INICIO: (context) =>
            WidgetCadastroPacienteInicio(),
        AppRoutes.CADASTRO_PACIENTE_FIM: (context) =>
            WidgetCadastroPacienteFim(),
        AppRoutes.EDICAO_PACIENTE_DADOS: (context) =>
            WidgetEdicaoPacienteDados(),
        AppRoutes.EDICAO_PACIENTE_ENDERECO: (context) =>
            WidgetEdicaoPacienteEndereco(),
        AppRoutes.LISTAGEM_MEDICOS: (context) => WidgetListagemMedicos(),
        AppRoutes.LOGIN: (context) => WidgetLogin(),
        AppRoutes.HISTORICO_CONSULTAS: (context) => WidgetHistoricoConsultas()
      },
    );
  }
}
