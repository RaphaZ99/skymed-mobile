import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInputTexto.dart';
import '../widgets/componentes/card-campo/botao.dart';
import '../widgets/componentes/card-campo/campo.dart';

class WidgetRecuperarSenhaPacienteNovaSenha extends StatefulWidget {
  @override
  _WidgetRecuperarSenhaPacienteNovaSenhaState createState() =>
      _WidgetRecuperarSenhaPacienteNovaSenhaState();
}

class _WidgetRecuperarSenhaPacienteNovaSenhaState
    extends State<WidgetRecuperarSenhaPacienteNovaSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            WidgetContainerInputTexto(
              texto: "Recuperar Senha",
              tamanhoDaLetra: 25.0,
            ),
            Text(
              'Digite sua nova senha abaixo.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 4, color: Colors.black, fontSize: 18.0),
            ),
            Campo(
              titulo: 'Digite sua senha',
              margem: EdgeInsets.only(top: 20.0),
            ),
            Campo(
              titulo: 'Digite sua senha novamente',
              margem: EdgeInsets.only(top: 20.0),
            ),
            Botao(
              titulo: 'Salvar',
              corLetra: Colors.black,
              corBorda: Colors.blue,
              corInterna: Colors.white,
              callback: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
