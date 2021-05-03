import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skymed_mobile/model/paciente.dart';

class Pacientes with ChangeNotifier {
  final _baseUrl = 'https://skymed-api.herokuapp.com/pessoa';

  adicionarPaciente(Paciente paciente) {
    http.post(Uri.parse('https://skymed-api.herokuapp.com/pessoa'),
        body: json.encode({
          "nome": paciente.nome,
          "cpf": paciente.cpf,
          "rg": paciente.rg,
          "email": paciente.email,
          "telefone": paciente.telefone,
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
    });
  }
}
