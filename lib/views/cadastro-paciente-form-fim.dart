import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/endereco.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/model/usuario.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';
import 'package:skymed_mobile/widgets/componentes/tema/circulos-topo.dart';

class WidgetCadastroPacienteFormFim extends StatefulWidget {
  Paciente novoPaciente;
  WidgetCadastroPacienteFormFim({this.novoPaciente});

  @override
  _WidgetCadastroPacienteFimState createState() =>
      _WidgetCadastroPacienteFimState();
}

class _WidgetCadastroPacienteFimState
    extends State<WidgetCadastroPacienteFormFim> {
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
    var novoEndereco = Endereco(
        cep: _formData['cep'],
        bairro: _formData['bairro'],
        complemento: _formData['complemento'],
        logradouro: _formData['logradouro'],
        numero: _formData['numero']);

    var novoUsuario = Usuario(
        ehAdmin: false,
        ehAutenticado: false,
        ehHospital: false,
        ehMedico: false,
        ehPaciente: true,
        email: widget.novoPaciente.email,
        senha: '1234');

    widget.novoPaciente.endereco = novoEndereco;
    widget.novoPaciente.usuario = novoUsuario;

    postData.adicionarPaciente(widget.novoPaciente);

    Navigator.of(context).popUntil((route) => route.isFirst);
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
                        labelText: 'CEP',
                        errorMaxLines: 2,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['cep'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('O CEP não pode ser vazio ');
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
                        labelText: 'Logradouro',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['Logradouro'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('Logradouro não pode estar Vazio');
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
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Bairro',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['bairro'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('O Bairro não pode estar vazio');
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Numero',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['numero'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('Numero não pode estar vazio');
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //inputFormatters: [mascaraTelefone],
                      obscureText: false,
                      decoration: InputDecoration(
                        errorMaxLines: 2,
                        labelText: 'Complemento',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['complemento'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('O Complemento não pode ser vazio.');
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
