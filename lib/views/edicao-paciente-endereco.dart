import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/endereco.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';

import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';

import 'menu-usuario.dart';

class WidgetEdicaoPacienteEndereco extends StatefulWidget {
  @override
  _WidgetEdicaoPacienteEnderecoState createState() =>
      _WidgetEdicaoPacienteEnderecoState();
}

class _WidgetEdicaoPacienteEnderecoState
    extends State<WidgetEdicaoPacienteEndereco> {
  Pacientes _putPaciente = Pacientes();
  Paciente atualizaPaciente = new Paciente();

  final _formData = Map<String, Object>();
  final _form = GlobalKey<FormState>();
  Future<Paciente> futurePaciente;

  void _saveForm() {
    //Metodo chama validator em todos os input
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }
    //Metodo chama onSave em cada um dos formulários
    _form.currentState.save();

    var atualizaEndereco = Endereco(
        cep: _formData['cep'],
        bairro: _formData['bairro'],
        complemento: _formData['complemento'],
        logradouro: _formData['logradouro'],
        numero: _formData['numero'],
        id: _formData['id'],
        ibge: _formData['ibge'],
        localidade: _formData['localidade']);

    atualizaPaciente.endereco = atualizaEndereco;
    _putPaciente.atualizaPaciente(atualizaPaciente);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WidgetMenuUsuario()));
  }

  @override
  void initState() {
    super.initState();
    futurePaciente = new Pacientes().obterPaciente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Paciente>(
        future: futurePaciente,
        builder: (context, paciente) {
          if (paciente.hasError) print(paciente.error);
          if (!paciente.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          atualizaPaciente.id = paciente.data.id;
          atualizaPaciente.nome = paciente.data.nome;
          atualizaPaciente.cpf = paciente.data.cpf;
          atualizaPaciente.email = paciente.data.usuario.email;
          atualizaPaciente.rg = paciente.data.rg;
          atualizaPaciente.telefone = paciente.data.telefone;
          atualizaPaciente.usuario = paciente.data.usuario;
          _formData['id'] = paciente.data.endereco.id;
          _formData['ibge'] = paciente.data.endereco.ibge;
          _formData['localidade'] = paciente.data.endereco.localidade;

          return Padding(
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
                          initialValue: paciente.data.endereco.cep,
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
                          initialValue: paciente.data.endereco.logradouro,
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
                          onSaved: (value) => _formData['logradouro'] = value,
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
                          initialValue: paciente.data.endereco.bairro,
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
                          initialValue: paciente.data.endereco.numero,
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
                          initialValue: paciente.data.endereco.complemento,
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
          );
        },
      ),
    );
  }
}
