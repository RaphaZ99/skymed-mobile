import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';
import 'package:skymed_mobile/widgets/componentes/tema/circulos-topo.dart';

class WidgetEdicaoPacienteEndereco extends StatefulWidget {
  @override
  _WidgetEdicaoPacienteEnderecoState createState() =>
      _WidgetEdicaoPacienteEnderecoState();
}

class _WidgetEdicaoPacienteEnderecoState
    extends State<WidgetEdicaoPacienteEndereco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 60.0,
            ),
            child: ListView(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              children: <Widget>[
                Container(
                  height: 120.0,
                  padding: EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  child: Logo(),
                ),
                Campo(
                  titulo: 'CEP',
                ),
                Campo(
                  titulo: 'Logradouro',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Campo(
                  titulo: 'Bairro',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Campo(
                  titulo: 'Número',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Campo(
                  titulo: 'Complemento',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Botao(
                  titulo: 'Salvar',
                  margem: EdgeInsets.only(
                    top: 40,
                  ),
                  callback: () => {Navigator.pop(context)},
                ),
                BotaoVoltarPadrao(),
              ],
            ),
          ),
          CirculosTopo(),
        ],
      ),
    );
  }
}
