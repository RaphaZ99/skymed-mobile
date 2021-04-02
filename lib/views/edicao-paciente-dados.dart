import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/login.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/tema/circulos-topo.dart';

import 'cadastro-paciente-fim.dart';

class WidgetEdicaoPacienteDados extends StatefulWidget {
  @override
  _WidgetEdicaoPacienteDadosState createState() =>
      _WidgetEdicaoPacienteDadosState();
}

class _WidgetEdicaoPacienteDadosState extends State<WidgetEdicaoPacienteDados> {
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
                  titulo: 'Nome',
                ),
                Campo(
                  titulo: 'CPF',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Campo(
                  titulo: 'RG',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Campo(
                  titulo: 'E-mail',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                Campo(
                  titulo: 'Telefone',
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
                Botao(
                  titulo: 'Voltar',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                  corBorda: Colors.red,
                  corInterna: Colors.white,
                  corLetra: Colors.black,
                  callback: () => {Navigator.pop(context)},
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
