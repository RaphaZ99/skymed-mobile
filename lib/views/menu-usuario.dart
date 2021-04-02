import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/edicao-paciente-dados.dart';
import 'package:skymed_mobile/views/edicao-paciente-endereco.dart';
import 'package:skymed_mobile/views/historico-consultas.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/icone-campo.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';

class WidgetMenuUsuario extends StatefulWidget {
  @override
  _WidgetMenuUsuario createState() => _WidgetMenuUsuario();
}

class _WidgetMenuUsuario extends State<WidgetMenuUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            IconeCampo(
              titulo: 'Nome Usuário',
              icone: Icon(
                Icons.person_pin,
                size: 70.0,
              ),
              tamanhoFonte: 30.0,
            ),
            IconeCampo(
              titulo: 'Histórico de Consultas',
              icone: Icon(
                Icons.history,
                size: 35.0,
              ),
              tamanhoFonte: 20.0,
              margem: EdgeInsets.only(
                left: 15.0,
                top: 30.0,
              ),
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WidgetHistoricoConsultas()),
                );
              },
            ),
            IconeCampo(
              titulo: 'Editar Cadastro',
              icone: Icon(
                Icons.edit,
                size: 35.0,
              ),
              tamanhoFonte: 20.0,
              margem: EdgeInsets.only(
                left: 15.0,
                top: 30.0,
              ),
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WidgetEdicaoPacienteDados()),
                );
              },
            ),
            IconeCampo(
              titulo: 'Editar Endereço',
              icone: Icon(
                Icons.edit_outlined,
                size: 35.0,
              ),
              tamanhoFonte: 20.0,
              margem: EdgeInsets.only(
                left: 15.0,
                top: 30.0,
              ),
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WidgetEdicaoPacienteEndereco()),
                );
              },
            ),
            IconeCampo(
              titulo: 'Sair',
              icone: Icon(
                Icons.history,
                size: 35.0,
              ),
              tamanhoFonte: 20.0,
              margem: EdgeInsets.only(
                left: 15.0,
                top: 30.0,
              ),
              callback: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            BotaoVoltarPadrao(
              margem: EdgeInsets.only(
                top: 225,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
