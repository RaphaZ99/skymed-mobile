import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/provider/base_http.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/menu-usuario.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-erro.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-sucesso.dart';

import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';

class WidgetEdicaoPacienteDados extends StatefulWidget {
  @override
  _WidgetEdicaoPacienteDadosState createState() =>
      _WidgetEdicaoPacienteDadosState();
}

class _WidgetEdicaoPacienteDadosState extends State<WidgetEdicaoPacienteDados> {
  Pacientes _putPaciente = Pacientes();

  final _formData = Map<String, Object>();
  final _form = GlobalKey<FormState>();
  Future<Paciente> futurePaciente;

  final mascaraCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final mascaraTelefone = MaskTextInputFormatter(
      mask: "###########", filter: {"#": RegExp(r'[0-9]')});

  void _saveForm() {
    //Metodo chama validator em todos os input
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }
    //Metodo chama onSave em cada um dos formulários
    _form.currentState.save();

    var atualizaPaciente = Paciente(
      id: _formData['id'],
      nome: _formData['nome'],
      cpf: _formData['cpf'],
      email: _formData['email'],
      rg: _formData['rg'],
      telefone: _formData['telefone'],
      origemPaciente: "mobile",
      endereco: _formData['endereco'],
      usuario: _formData['usuario'],
    );

    _putPaciente.atualizaPaciente(atualizaPaciente).then((value) {
      if (value == 200) {
        showDialog(
            context: context,
            builder: (context) =>
                ModalSucesso("Dados atualizados com Sucesso")).then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WidgetMenuUsuario()));
        });
      } else {
        showDialog(
            context: context,
            builder: (context) =>
                ModalErro("Erro ao atualizar o cliente " + value.toString()));
      }
    });
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

          _formData['endereco'] = paciente.data.endereco;
          _formData['usuario'] = paciente.data.usuario;
          _formData['id'] = paciente.data.id;

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
                          initialValue: paciente.data.nome,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: paciente.data.nome,
                            errorMaxLines: 2,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            _saveForm();
                          },
                          onSaved: (value) => _formData['nome'] = value,
                          validator: (value) {
                            if (value.length < 3) {
                              return ('O nome não pode ser vazio e deve conter mais que 3 caracteres');
                            }
                            if (value.trim().isEmpty) {
                              _formData['nome'] = paciente.data.nome;
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
                          inputFormatters: [mascaraCpf],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          initialValue: paciente.data.cpf,
                          enabled: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: paciente.data.cpf,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onSaved: (value) =>
                              _formData['cpf'] = paciente.data.cpf,
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
                          initialValue: paciente.data.rg,
                          enabled: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: paciente.data.rg,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onSaved: (value) =>
                              _formData['rg'] = paciente.data.rg,
                        ),
                      ),
                      margin: EdgeInsets.only(top: 15.0),
                      elevation: 0,
                    ),
                    Card(
                      child: ListTile(
                        title: TextFormField(
                          textInputAction: TextInputAction.next,
                          initialValue: paciente.data.usuario.email,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onSaved: (value) => _formData['email'] = value,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Email não pode está vazio";
                            }
                            if (!EmailValidator.validate(value)) {
                              return "Email Inválido";
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
                          initialValue: paciente.data.telefone,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: [mascaraTelefone],
                          obscureText: false,
                          decoration: InputDecoration(
                            errorMaxLines: 2,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onSaved: (value) => _formData['telefone'] = value,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.trim().isEmpty || value.length < 11) {
                              return "Telefone não pode está vazio ou conter menos que 11 digitos";
                            }
                          },
                        ),
                      ),
                      margin: EdgeInsets.only(top: 15.0),
                      elevation: 0,
                    ),
                    Botao(
                      titulo: 'Salvar',
                      margem: EdgeInsets.only(
                        top: 40,
                      ),
                      callback: () => {
                        _saveForm(),
                        // Navigator.push(
                        // context,
                        //  MaterialPageRoute(
                        //      builder: (context) => WidgetCadastroPacienteFim()),
                        //  )
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
