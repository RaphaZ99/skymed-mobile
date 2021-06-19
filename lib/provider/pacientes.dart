import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/provider/base_http.dart';

class Pacientes with ChangeNotifier {
  final _baseHttp = new BaseHttp();

  Future<void> authenticate(String senha, String email, context) async {
    final Object body = json.encode(
      {
        "email": email,
        "senha": senha,
      },
    );

    await _baseHttp
        .postPadrao(body, Uri.parse('${BaseHttp.baseUrl}/login'))
        .then((value) {
      final responseBody = json.decode(value.body);

      BaseHttp.tokenJWT = responseBody['token'];
    });
    notifyListeners();

    return Future.value();
  }

  Future<void> adicionarPaciente(Paciente paciente) async {
    final Object body = json.encode({
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
    });

    await _baseHttp
        .postPadrao(body, Uri.parse('${BaseHttp.baseUrl}/pessoa'))
        .then((value) {
      return value.statusCode;
    });
  }
}
