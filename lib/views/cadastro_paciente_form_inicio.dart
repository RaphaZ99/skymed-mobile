import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/cadastro-paciente-fim.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:email_validator/email_validator.dart';

class WidgetCadastroPacienteInicio extends StatefulWidget {
  @override
  _WidgetCadastroPacienteInicioState createState() =>
      _WidgetCadastroPacienteInicioState();
}

class _WidgetCadastroPacienteInicioState
    extends State<WidgetCadastroPacienteInicio> {
  final postData = Pacientes();
  final _formData = Map<String, Object>();
  final _form = GlobalKey<FormState>();
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

    var novoPaciente = Paciente(
        id: null,
        nome: _formData['nome'],
        cpf: _formData['cpf'],
        email: _formData['email'],
        rg: _formData['rg'],
        telefone: _formData['telefone'],
        endereco: null,
        usuario: null);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WidgetCadastroPacienteFim(novoPaciente: novoPaciente)));
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
                        labelText: 'Nome',
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
                        if (value.length < 3 || value.trim().isEmpty) {
                          return ('O nome não pode ser vazio e deve conter mais que 3 caracteres');
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
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['cpf'] = value,
                      validator: (value) {
                        if (value.length < 14 || value.trim().isEmpty) {
                          return ('CPF incompleto ou Vazio');
                        }
                        if (!CPF.isValid(value)) {
                          return ('CPF inválido');
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
                        labelText: 'RG',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['rg'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('O RG não pode estar vazio');
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
                        labelText: 'E-mail',
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
                          return ('E-mail não pode estar vazio');
                        }
                        if (!EmailValidator.validate(value)) {
                          return ('E-mail Inválido');
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
                      inputFormatters: [mascaraTelefone],
                      obscureText: false,
                      decoration: InputDecoration(
                        errorMaxLines: 2,
                        labelText: 'Telefone',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['telefone'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty || value.length < 11) {
                          return ('O telefone não pode ser vazio e deve conter mais que 11 caracteres');
                        }
                      },
                    ),
                  ),
                  margin: EdgeInsets.only(top: 15.0),
                  elevation: 0,
                ),
                Botao(
                  titulo: 'Continuar',
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
      ),
    );
  }
}
