import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skymed_mobile/model/endereco.dart';
import 'package:skymed_mobile/model/paciente.dart';
import 'package:skymed_mobile/model/usuario.dart';
import 'package:skymed_mobile/provider/base_http.dart';

class Pacientes with ChangeNotifier {
  final _baseHttp = new BaseHttp();

  Future<String> authenticate(String senha, String email, context) async {
    final Object body = json.encode(
      {
        "email": email,
        "senha": senha,
      },
    );

    await _baseHttp
        .postPadrao(body, Uri.parse('${BaseHttp.baseUrl}/login'))
        .then((value) {
      if (value.statusCode == 200) {
        final responseBody = json.decode(value.body);
        BaseHttp.tokenJWT = responseBody['token'];
        BaseHttp.usuarioEmail = email;
        return value.statusCode.toString();
      } else {
        return value.statusCode.toString();
      }
    });
    notifyListeners();
  }

  Future<String> adicionarPaciente(Paciente paciente) async {
    final Object body = json.encode({
      "nome": paciente.nome,
      "cpf": paciente.cpf,
      "rg": paciente.rg,
      "email": paciente.email,
      "telefone": paciente.telefone,
      "origemPaciente": paciente.origemPaciente,
      "endereco": {
        "cep": paciente.endereco.cep,
        "logradouro": paciente.endereco.logradouro,
        "complemento": paciente.endereco.complemento,
        "numero": paciente.endereco.numero,
        "uf": paciente.endereco.uf,
        "ibge": paciente.endereco.ibge,
        "localidade": paciente.endereco.localidade
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
    var statusCode;
    var bodyResponse;

    await _baseHttp
        .postPadrao(body, Uri.parse('${BaseHttp.baseUrl}/pessoa'))
        .then((value) {
      statusCode = value.statusCode;
      bodyResponse = value.body;
    });

    return statusCode == 200 ? statusCode.toString() : bodyResponse;
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
        "logradouro": paciente.endereco.logradouro,
        "complemento": paciente.endereco.complemento,
        "ibge": paciente.endereco.ibge,
        "localidade": paciente.endereco.localidade,
        "uf": paciente.endereco.uf
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

    var statusCode;
    var bodyResponse;

    await _baseHttp
        .putPadrao(body, Uri.parse('${BaseHttp.baseUrl}/pessoa'))
        .then((value) {
      statusCode = value.statusCode;
      bodyResponse = value.body;
    });

    return statusCode == 200 ? statusCode.toString() : bodyResponse;
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

  Future<Endereco> obterEndereco(String cep) async {
    final resposta = await _baseHttp
        .getPadrao(Uri.parse('https://viacep.com.br/ws/${cep}/json/'));

    return convertaEndereco(resposta.body);
  }

  Future<Usuario> atualizaUsuario(Usuario usuario) async {
    final Object body = json.encode({
      "id": usuario.id,
      "email": usuario.email,
      "senha": usuario.senha,
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

  Future<String> alteraUsuario(Usuario usuario) async {
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

    return response.statusCode == 200
        ? response.statusCode.toString()
        : response.body;
  }

  Future<Paciente> obterPaciente() async {
    Usuario usuario = await obterUsuario();
    final resposta = await _baseHttp
        .getPadrao(Uri.parse('${BaseHttp.baseUrl}/pessoa/${usuario.id}'));

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

  Endereco convertaEndereco(String body) {
    Map enderecoJson = json.decode(body);

    return Endereco.fromJson(enderecoJson);
  }
}
