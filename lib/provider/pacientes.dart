import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skymed_mobile/model/paciente.dart';

class Pacientes with ChangeNotifier {
  final _baseUrl = 'https://skymed-api.herokuapp.com';

  String _token;

  bool get isAutenticado {
    return token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
  }

  Future<void> authenticate(String senha, String email) async {
    await http.post(Uri.parse('$_baseUrl/login'),
        body: json.encode(
          {
            "email": email,
            "senha": senha,
          },
        ),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }).then((value) {
      print(value.statusCode);
      print(value.request);
      print(value.body);
      final responseBody = json.decode(value.body);
      _token = responseBody['token'];
    });
    notifyListeners();

    return Future.value();
  }

  Future<void> adicionarPaciente(Paciente paciente) async {
    await http.post(Uri.parse('$_baseUrl/pessoa'),
        body: json.encode({
          "nome": paciente.nome,
          "cpf": paciente.cpf,
          "rg": paciente.rg,
          "email": paciente.email,
          "telefone": paciente.telefone,
          "origemPaciente": paciente.origemPaciente,
          "endereco": {
            "cep": paciente.endereco.cep,
            "bairro": paciente.endereco.bairro,
            "logradouro": paciente.endereco.logradouro,
            "complemento": paciente.endereco.complemento,
            "numero": paciente.endereco.numero
          },
          "usuario": {
            "ehAdmin": paciente.usuario.ehAdmin,
            "ehMedidco": paciente.usuario.ehMedico,
            "ehAutenticado": paciente.usuario.ehAutenticado,
            "ehHospital": paciente.usuario.ehHospital,
            "ehPaciente": paciente.usuario.ehPaciente,
            "email": paciente.usuario.email,
            "senha": paciente.usuario.senha,
          }
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }).then((value) {
      print(value.statusCode);
      print(value.request);
      print(value.body);
      return value.statusCode;
    });
  }
}
