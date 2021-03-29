import 'package:flutter/material.dart';
import 'package:skymed_mobile/routes/app_routes.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInformacao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';

import 'recuperar-senha-paciente-codigo.dart';
import 'recuperar-senha-paciente-codigo.dart';

class WidgetRecuperarSenhaPacienteIformarEmail extends StatefulWidget {
  @override
  _WidgetRecuperarSenhaPacienteIformarEmailState createState() =>
      _WidgetRecuperarSenhaPacienteIformarEmailState();
}

class _WidgetRecuperarSenhaPacienteIformarEmailState
    extends State<WidgetRecuperarSenhaPacienteIformarEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: <Widget>[
                ContainerInformacao(
                  texto: "Recuperar Senha",
                ),
                GestureDetector(
                  child: Text(
                    'Digite seu E-mail para enviarmos um código \n para redefinirmos sua senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 3),
                  ),
                ),
                Campo(
                  titulo: 'Informe seu e-mail',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Botao(
                  titulo: 'Próximo',
                  corBorda: Colors.blue,
                  corLetra: Colors.black,
                  corInterna: Colors.white,
                  margem: EdgeInsets.only(top: 30),
                  callback: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            WidgetRecuperarSenhaPacienteCodigo()),
                  ),
                ),
                Botao(
                  titulo: 'Voltar',
                  corBorda: Colors.red,
                  corLetra: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
