import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/usuario.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-nova-senha.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInputTexto.dart';
import 'package:skymed_mobile/widgets/componentes/divisor/divisor.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-erro.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';
import 'recuperar-senha-paciente-codigo.dart';

class WidgetRecuperarSenhaPacienteIformarEmail extends StatefulWidget {
  @override
  _WidgetRecuperarSenhaPacienteIformarEmailState createState() =>
      _WidgetRecuperarSenhaPacienteIformarEmailState();
}

class _WidgetRecuperarSenhaPacienteIformarEmailState
    extends State<WidgetRecuperarSenhaPacienteIformarEmail> {
  final _formData = Map<String, Object>();
  final _form = GlobalKey<FormState>();
  Future<Usuario> putUsuario;
  Usuario usuario = new Usuario();

  // final mascaraCpf = MaskTextInputFormatter(
  // mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  // final mascaraTelefone = MaskTextInputFormatter(
  // mask: "###########", filter: {"#": RegExp(r'[0-9]')});

  void _saveForm() async {
    //Metodo chama validator em todos os input
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }
    //Metodo chama onSave em cada um dos formulários
    _form.currentState.save();

    await Pacientes().obterUsuarioPorEmail(_formData['email']).then((value) {
      usuario.email = value.email;
      usuario.ehPaciente = value.ehPaciente;
      usuario.ehHospital = value.ehHospital;
      usuario.ehMedico = value.ehMedico;
      usuario.id = value.id;
      usuario.senha = value.senha;
      usuario.tokenRedefinicaoSenha = value.tokenRedefinicaoSenha;
      usuario.ehAdmin = value.ehAdmin;
      usuario.ehAutenticado = value.ehAutenticado;
    });

    await Pacientes().atualizaUsuario(usuario).then((value) {
      usuario.tokenRedefinicaoSenha = value.tokenRedefinicaoSenha;
    });

    if (usuario.id != '') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WidgetRecuperarSenhaPacienteCodigo(
                    usuario: usuario,
                  )));
    } else {
      showDialog(
          context: context,
          builder: (context) => ModalErro(
              "Erro ao Enviar o código de senha. Contate o suporte."));
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
                        labelText:
                            'Informe seu email para recuperação de senha',
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
                BotaoVoltarPadrao()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
