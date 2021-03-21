import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/tema/circulos-topo.dart';

class WidgetCadastroPacienteInicio extends StatefulWidget {
  @override
  _WidgetCadastroPacienteInicioState createState() =>
      _WidgetCadastroPacienteInicioState();
}

class _WidgetCadastroPacienteInicioState
    extends State<WidgetCadastroPacienteInicio> {
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
                  titulo: 'Nome',
                ),
                Campo(
                  titulo: 'CPF',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Campo(
                  titulo: 'RG',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Campo(
                  titulo: 'E-mail',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Campo(
                  titulo: 'Telefone',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Botao(
                  titulo: 'Continuar',
                  margem: EdgeInsets.only(
                    top: 40,
                  ),
                  callback: () => {},
                ),
                Botao(
                  titulo: 'Voltar',
                  margem: EdgeInsets.only(
                    top: 40,
                  ),
                  corBorda: Colors.red,
                  corInterna: Colors.white,
                  corLetra: Colors.black,
                  callback: () => {},
                ),
              ],
            ),
          ),
          CirculosTopo(),
        ],
      ),
    );
  }
}
