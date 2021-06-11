import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/auth_home_screen.dart';
import 'package:skymed_mobile/views/cadastro-paciente-form_dados_endereco.dart';
import 'package:skymed_mobile/views/cadastro_paciente_form_dados_pessoais.dart';
import 'package:skymed_mobile/views/edicao-paciente-dados.dart';
import 'package:skymed_mobile/views/edicao-paciente-endereco.dart';
import 'package:skymed_mobile/views/historico-consultas.dart';
import 'package:skymed_mobile/views/listagem-medicos.dart';
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
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Login',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Pacientes(),
        ),
      ],
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthOrHomeScreen(),
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
              WidgetCadastroPacienteFormFim(),
          AppRoutes.EDICAO_PACIENTE_DADOS: (context) =>
              WidgetEdicaoPacienteDados(),
          AppRoutes.EDICAO_PACIENTE_ENDERECO: (context) =>
              WidgetEdicaoPacienteEndereco(),
          AppRoutes.LISTAGEM_MEDICOS: (context) => WidgetListagemMedicos(),
          AppRoutes.AUTH_HOME: (context) => AuthOrHomeScreen(),
          AppRoutes.HISTORICO_CONSULTAS: (context) =>
              WidgetHistoricoConsultas(),
        },
      ),
    );
  }
}
