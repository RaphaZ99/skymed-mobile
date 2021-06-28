import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/model/usuario.dart';
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
      BaseHttp.usuarioEmail = email;
    });
    notifyListeners();

    return Future.value();
  }

  Future<int> adicionarPaciente(Paciente paciente) async {
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
      print(value.body);
      print(value.statusCode);
      return value.statusCode;
    });
  }

  Future<String> atualizaPaciente(Paciente paciente) async {
    final Object body = json.encode({
      "id": paciente.id,
      "nome": paciente.nome,
      "email": paciente.email,
      "cpf": paciente.cpf,
      "rg": paciente.rg,
      "telefone": paciente.telefone,
      "origemPaciente": paciente.origemPaciente,
      "endereco": {
        "id": paciente.endereco.id,
        "cep": paciente.endereco.cep,
        "bairro": paciente.endereco.bairro,
        "logradouro": paciente.endereco.logradouro,
        "complemento": paciente.endereco.complemento,
        "numero": paciente.endereco.numero,
        "localidade": paciente.endereco.localidade,
        "ibge": paciente.endereco.ibge
      },
      "usuario": {
        "id": paciente.usuario.id,
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
        .putPadrao(body, Uri.parse('${BaseHttp.baseUrl}/pessoa'))
        .then((value) {
      return value.statusCode == 200 ? value.statusCode.toString() : value.body;
    });
  }

  Future<Usuario> obterUsuario() async {
    final resposta = await _baseHttp.getPadrao(
        Uri.parse('${BaseHttp.baseUrl}/usuario/${BaseHttp.usuarioEmail}'));

    return convertaUsuario(resposta.body);
  }

  Future<Usuario> obterUsuarioPorEmail(String email) async {
    final resposta = await _baseHttp
        .getPadrao(Uri.parse('${BaseHttp.baseUrl}/usuario/${email}'));

    return convertaUsuario(resposta.body);
  }

  Future<Usuario> atualizaUsuario(Usuario usuario) async {
    final Object body = json.encode({
      "id": usuario.id,
      "email": usuario.email,
      "senha": usuario.senha,
      "tokenAutenticacao": "null",
      "tokenAutenticacaoEmail": usuario.tokenAutenticacaoEmail,
      "tokenRedefinicaoSenha": usuario.tokenRedefinicaoSenha,
      "ehAdmin": false,
      "ehMedico": false,
      "ehHospital": false,
      "ehPaciente": true,
      "ehAutenticado": false,
      "novaSenha": usuario.novaSenha,
      "tokenAutenticacao": usuario.tokenAutenticacao
    });

    final usuarioBody = await _baseHttp.putPadrao(
        body, Uri.parse('${BaseHttp.baseUrl}/usuario/recuperarsenha'));

    return convertaUsuario(usuarioBody.body);
  }

  Future<int> alteraUsuario(Usuario usuario) async {
    final Object body = json.encode({
      "id": usuario.id,
      "email": usuario.email,
      "senha": usuario.senha,
      "tokenAutenticacao": "null",
      "tokenAutenticacaoEmail": usuario.tokenAutenticacaoEmail,
      "tokenRedefinicaoSenha": usuario.tokenRedefinicaoSenha,
      "ehAdmin": false,
      "ehMedico": false,
      "ehHospital": false,
      "ehPaciente": true,
      "ehAutenticado": false,
      "novaSenha": usuario.novaSenha,
      "tokenAutenticacao": usuario.tokenAutenticacao
    });

    var response = await _baseHttp.putPadrao(
        body, Uri.parse('${BaseHttp.baseUrl}/usuario/alterarsenha'));

    var statusCode = response.statusCode;
    return response.statusCode;
  }

  Future<Paciente> obterPaciente() async {
    Usuario usuario = await obterUsuario();
    final resposta = await _baseHttp.getPadrao(
        Uri.parse('${BaseHttp.baseUrl}/pessoa/usuario/${usuario.id}'));

    return convertaPaciente(resposta.body);
  }

  Paciente convertaPaciente(String body) {
    Map pacienteJson = json.decode(body);

    return Paciente.fromJson(pacienteJson);
  }

  Usuario convertaUsuario(String body) {
    Map usuarioJson = json.decode(body);

    return Usuario.fromJson(usuarioJson);
  }
}
