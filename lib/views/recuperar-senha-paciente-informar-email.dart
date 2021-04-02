import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInputTexto.dart';
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
      body: Container(
        child: ListView(
          children: <Widget>[
            WidgetContainerInputTexto(
               texto: "Recuperar Senha",
               tamanhoDaLetra: 25.0,
            ),
            Text(
              'Digite seu E-mail para enviarmos um código.',
              textAlign: TextAlign.center,
              
              style: TextStyle(height: 4,
              fontSize: 18.0),
              
            ),
            Campo(
              titulo: 'E-mail',
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
                    builder: (context) => WidgetRecuperarSenhaPacienteCodigo()),
              ),
            ),
            Botao(
              titulo: 'Voltar',
              corBorda: Colors.red,
              corLetra: Colors.black,
              corInterna: Colors.white,
              callback: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
