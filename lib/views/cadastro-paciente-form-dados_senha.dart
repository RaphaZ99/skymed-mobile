import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/login.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';

import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';

class WidgetCadastroPacienteFormSenha extends StatefulWidget {
  Paciente novoPaciente;
  WidgetCadastroPacienteFormSenha({this.novoPaciente});

  @override
  _WidgetCadastroPacienteSenhaState createState() =>
      _WidgetCadastroPacienteSenhaState();
}

class _WidgetCadastroPacienteSenhaState
    extends State<WidgetCadastroPacienteFormSenha> {
  final _senhaController = TextEditingController();
  final postData = Pacientes();
  final _formData = Map<String, Object>();
  final _form = GlobalKey<FormState>();

  void _saveForm() {
    //Metodo _form.currentState.validate chama validator em todos os input
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }
    //Metodo chama onSave em cada um dos formulários
    _form.currentState.save();
    widget.novoPaciente.usuario.senha = _formData['senha'];

    var response = postData.adicionarPaciente(widget.novoPaciente);
    if (response == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WidgetLogin()));
    } else {
      print("Caiu no Else");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Form(
          key: _form,
          child: Container(
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
                Card(
                  child: ListTile(
                    title: TextFormField(
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        errorMaxLines: 2,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      controller: _senhaController,
                      onSaved: (value) => _formData['senha'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty || value.length > 5) {
                          return ('A senha não pode está vazia ou conter menos que 5 dígitos');
                        }
                      },
                    ),
                  ),
                  margin: EdgeInsets.only(top: 15.0),
                  elevation: 0,
                ),
                Card(
                  child: ListTile(
                    title: TextFormField(
                      //inputFormatters: [mascaraCpf],
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Confirme a Senha',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      validator: (value) {
                        if (value != _senhaController.text) {
                          return ('As senhas não correspondem');
                        }
                      },
                    ),
                  ),
                  margin: EdgeInsets.only(top: 15.0),
                  elevation: 0,
                ),
                Botao(
                  titulo: 'Concluir',
                  margem: EdgeInsets.only(
                    top: 40,
                  ),
                  callback: () {
                    _saveForm();
                  },
                ),
                BotaoVoltarPadrao(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
