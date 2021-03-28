import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/cadastro-paciente-inicio.dart';
import 'package:skymed_mobile/views/listagem-medicos.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/divisor/divisor.dart';
import 'package:skymed_mobile/widgets/componentes/tema/circulos-topo.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
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
              children: <Widget>[
                Container(
                  height: 120.0,
                  padding: EdgeInsets.only(
                    bottom: 30.0,
                  ),
                  child: Logo(),
                ),
                Campo(
                  titulo: 'E-mail',
                ),
                Campo(
                  ehSenha: true,
                  titulo: 'Senha',
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Esqueci minha senha foi pressionado.');
                  },
                  child: Text(
                    'Esqueci minha senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 3,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Botao(
                  titulo: 'Login',
                  corBorda: Colors.black,
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                  callback: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetListagemMedicos()),
                    )
                  },
                ),
                Divisor(),
                Botao(
                  titulo: 'Login com o Google',
                  corBorda: Colors.green,
                  corLetra: Colors.black,
                  corInterna: Colors.white,
                  margem: EdgeInsets.only(
                    top: 0,
                  ),
                  callback: () => {},
                ),
                Botao(
                  titulo: 'Login com o Facebook',
                  corBorda: Colors.blue,
                  corLetra: Colors.black,
                  corInterna: Colors.white,
                  margem: EdgeInsets.only(
                    top: 15,
                  ),
                  callback: () => {},
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetCadastroPacienteInicio()),
                    );
                  },
                  child: Text(
                    'Não tem uma conta? Cadastre-se',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 6,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
              padding: const EdgeInsets.only(
                top: 50,
              ),
            ),
          ),
          CirculosTopo(),
        ],
      ),
    );
  }
}
