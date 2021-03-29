import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-nova-senha.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInputTexto.dart';
import '../widgets/componentes/card-campo/botao.dart';

class WidgetRecuperarSenhaPacienteCodigo extends StatefulWidget {
  @override
  _WidgetRecuperarSenhaPacienteCodigoState createState() =>
      _WidgetRecuperarSenhaPacienteCodigoState();
}

class _WidgetRecuperarSenhaPacienteCodigoState
    extends State<WidgetRecuperarSenhaPacienteCodigo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            WidgetContainerInputTexto(
               texto: "Recuperar Senha",
               tamanhoDaLetra: 25.0,
               alturaDoTexto: 2,
            ),
            Text(
              'Digite o código enviado para seu e-mail',
              textAlign: TextAlign.center,
              style: TextStyle(height: 5, fontSize: 18.0),
            ),
            GestureDetector(
              onTap: () {
                // Metodo para reenviar código de redefinição
              },
              child: Text(
                'Enviar Código Novamente',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1, color: Colors.blue),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetContainerInputTexto(
                  widget: TextField(),
                  corDaBorda: Colors.black,
                  largura: 55.0,
                  alturaDoTexto: 2.0,
                  tamanhoDaLetra: 25.0,
                ),
                WidgetContainerInputTexto(
                  widget: TextField(),
                  corDaBorda: Colors.black,
                  largura: 55.0,
                ),
                WidgetContainerInputTexto(
                  widget: TextField(),
                  corDaBorda: Colors.black,
                  largura: 55.0,
                ),
                WidgetContainerInputTexto(
                  widget: TextField(),
                  corDaBorda: Colors.black,
                  largura: 55.0,
                ),
              ],
            ),
            Botao(
              titulo: 'Próximo',
              corInterna: Colors.white,
              corBorda: Colors.blue,
              corLetra: Colors.black,
              callback: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WidgetRecuperarSenhaPacienteNovaSenha(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
