import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-nova-senha.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInformacao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerRetangularTextField.dart';
import '../widgets/componentes/card-campo/botao.dart';
import '../widgets/componentes/card-campo/containerInformacao.dart';


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
      body: Stack(
        children: [
          Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ContainerInformacao(
                  texto: "Recuperar Senha",
                ),
                GestureDetector(
                  onTap: () {
                    // Metodo de reenviar código de redefinição
                  },
                  child: Text(
                    'Digite o código enviado para seu e-mail',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 5),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Enviar Código Novamente',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1, color: Colors.blue),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetContainerRetangularTextField(
                      corDaBorda: Colors.black,
                      largura: 55.0,
                    ),
                    WidgetContainerRetangularTextField(
                      corDaBorda: Colors.black,
                      largura: 55.0,
                    ),
                    WidgetContainerRetangularTextField(
                      corDaBorda: Colors.black,
                      largura: 55.0,
                    ),
                    WidgetContainerRetangularTextField(
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
                      builder: (context) =>
                          WidgetRecuperarSenhaPacienteNovaSenha(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
