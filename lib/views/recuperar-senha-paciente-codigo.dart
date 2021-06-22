import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/usuario.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/recuperar-senha-paciente-nova-senha.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/logo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/containerInputTexto.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';
import '../widgets/componentes/card-campo/botao.dart';

class WidgetRecuperarSenhaPacienteCodigo extends StatefulWidget {
  Usuario usuario;
  WidgetRecuperarSenhaPacienteCodigo({this.usuario});
  @override
  _WidgetRecuperarSenhaPacienteCodigoState createState() =>
      _WidgetRecuperarSenhaPacienteCodigoState();
}

class _WidgetRecuperarSenhaPacienteCodigoState
    extends State<WidgetRecuperarSenhaPacienteCodigo> {
//  final postData = Usuarios();
  final _formData = Map<String, Object>();
  final _form = GlobalKey<FormState>();
  // final mascaraCpf = MaskTextInputFormatter(
  // mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  // final mascaraTelefone = MaskTextInputFormatter(
  // mask: "###########", filter: {"#": RegExp(r'[0-9]')});

  void _saveForm() {
    //Metodo chama validator em todos os input
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }
    //Metodo chama onSave em cada um dos formulários
    _form.currentState.save();

    if (widget.usuario.tokenRedefinicaoSenha == _formData['token']) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WidgetRecuperarSenhaPacienteNovaSenha(
                  usuario: widget.usuario)));
    } else {
      //Colocar Erro
    }

    // WidgetCadastroPacienteFormFim(novoPaciente: novoPaciente)));
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
                        labelText: 'Informe o Token',
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
                      onSaved: (value) => _formData['token'] = value,
                      validator: (value) {
                        if (value.length < 4 ||
                            value.trim().isEmpty ||
                            value.length >= 5) {
                          return ('O token não pode ser vazio e contém 4 digitos');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//             WidgetContainerInputTexto(
//               texto: "Recuperar Senha",
//               tamanhoDaLetra: 25.0,
//               alturaDoTexto: 2,
//             ),
//             Text(
//               'Digite o código enviado para seu e-mail',
//               textAlign: TextAlign.center,
//               style: TextStyle(height: 5, fontSize: 18.0),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Metodo para reenviar código de redefinição
//               },
//               child: Text(
//                 'Enviar Código Novamente',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(height: 1, color: Colors.blue),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 WidgetContainerInputTexto(
//                   widget: TextField(),
//                   corDaBorda: Colors.black,
//                   largura: 55.0,
//                   alturaDoTexto: 2.0,
//                   tamanhoDaLetra: 25.0,
//                 ),
//                 WidgetContainerInputTexto(
//                   widget: TextField(),
//                   corDaBorda: Colors.black,
//                   largura: 55.0,
//                 ),
//                 WidgetContainerInputTexto(
//                   widget: TextField(),
//                   corDaBorda: Colors.black,
//                   largura: 55.0,
//                 ),
//                 WidgetContainerInputTexto(
//                   widget: TextField(),
//                   corDaBorda: Colors.black,
//                   largura: 55.0,
//                 ),
//               ],
//             ),
//             Botao(
//               titulo: 'Próximo',
//               corBorda: Colors.black,
//               corLetra: Colors.white,
//               corInterna: Colors.black,
//               callback: () => Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => WidgetRecuperarSenhaPacienteNovaSenha(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
