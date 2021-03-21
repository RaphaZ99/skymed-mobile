import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/tema/circulos-topo.dart';

class WidgetCadastroPacienteFim extends StatefulWidget {
  @override
  _WidgetCadastroPacienteFimState createState() =>
      _WidgetCadastroPacienteFimState();
}

class _WidgetCadastroPacienteFimState extends State<WidgetCadastroPacienteFim> {
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
                  titulo: 'CEP',
                ),
                Campo(
                  titulo: 'Logradouro',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Campo(
                  titulo: 'Bairro',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Campo(
                  titulo: 'Número',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Campo(
                  titulo: 'Complemento',
                  margem: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Botao(
                  titulo: 'Concluir',
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
