import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/cadastro_paciente_form_dados_pessoais.dart';
import 'package:skymed_mobile/views/listagem-medicos.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/divisor/divisor.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

final _formData = Map<String, Object>();
final _form = GlobalKey<FormState>();
final _postLogin = Pacientes();

Future<void> _login(context) async {
  if (_form.currentState.validate()) {
    _form.currentState.save();

    await _postLogin.authenticate(_formData['senha'], _formData['email']);

    if (_postLogin.isAutenticado) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WidgetListagemMedicos()));
    }
  }
}

class _WidgetLoginState extends State<WidgetLogin> {
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
                      //inputFormatters: [mascaraCpf],
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
                          return ('E-mail não pode estar Vazio');
                        }
                        if (!EmailValidator.validate(value)) {
                          return ('E-mail inválido');
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
                        labelText: 'Senha',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onSaved: (value) => _formData['senha'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ('senha não pode estar vazia');
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
                    _login(this.context);
                  },
                ),
                BotaoVoltarPadrao(),
                Divisor(),
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
                      height: 0.5,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             key: _form,
//             color: Colors.white,
//             padding: const EdgeInsets.only(
//               left: 30.0,
//               right: 30.0,
//               top: 60.0,
//             ),
//             child: ListView(
//               children: <Widget>[

//                 Container(
//                   height: 120.0,
//                   padding: EdgeInsets.only(
//                     bottom: 30.0,
//                   ),
//                   child: Logo(),
//                 ),

//                 Container(
//                   child: Card(
//                     child: ListTile(
//                       title: TextFormField(
//                         //inputFormatters: [mascaraCpf],
//                         textInputAction: TextInputAction.next,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           labelText: 'E-mail',
//                           floatingLabelBehavior: FloatingLabelBehavior.auto,
//                           contentPadding:
//                               EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(32.0),
//                           ),
//                         ),
//                         onSaved: (value) => _formData['e-mail'] = value,
//                         validator: (value) {
//                           if (value.trim().isEmpty) {
//                             return ('E-mail não pode estar Vazio');
//                           }
//                           if (!EmailValidator.validate(value)) {
//                             return ('E-mail inválido');
//                           }
//                         },
//                       ),
//                     ),
//                     margin: EdgeInsets.only(top: 15.0),
//                     elevation: 0,
//                   ),
//                 ),
//                 Container(
//                   child: Card(
//                     child: ListTile(
//                       title: TextFormField(
//                         //inputFormatters: [mascaraCpf],
//                         textInputAction: TextInputAction.next,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           labelText: 'Senha',
//                           floatingLabelBehavior: FloatingLabelBehavior.auto,
//                           contentPadding:
//                               EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(32.0),
//                           ),
//                         ),
//                         onSaved: (value) => _formData['senha'] = value,
//                         validator: (value) {
//                           if (value.trim().isEmpty) {
//                             return ('senha não pode estar vazia');
//                           }
//                         },
//                       ),
//                     ),
//                     margin: EdgeInsets.only(top: 15.0),
//                     elevation: 0,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             WidgetRecuperarSenhaPacienteIformarEmail(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     'Esqueci minha senha',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       height: 3,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//                 Botao(
//                   titulo: 'Login',
//                   corBorda: Colors.black,
//                   margem: EdgeInsets.only(
//                     top: 15,
//                   ),
//                   callback: () => {
//                     _login(),
//                     /*Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => WidgetListagemMedicos()),
//                     )*/
//                   },
//                 ),
//                 Divisor(),
//                 Botao(
//                   titulo: 'Login com o Google',
//                   corBorda: Colors.green,
//                   corLetra: Colors.black,
//                   corInterna: Colors.white,
//                   margem: EdgeInsets.only(
//                     top: 0,
//                   ),
//                   callback: () => {},
//                 ),
//                 Botao(
//                   titulo: 'Login com o Facebook',
//                   corBorda: Colors.blue,
//                   corLetra: Colors.black,
//                   corInterna: Colors.white,
//                   margem: EdgeInsets.only(
//                     top: 15,
//                   ),
//                   callback: () => {},
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => WidgetCadastroPacienteInicio()),
//                     );
//                   },
//                   child: Text(
//                     'Não tem uma conta? Cadastre-se',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       height: 6,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//               padding: const EdgeInsets.only(
//                 top: 50,
//               ),
//             ),
//           ),
//           CirculosTopo(),
//         ],
//       ),
//     );
//   }
// }
