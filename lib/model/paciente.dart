import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/endereco.dart';
import 'package:skymed_mobile/model/usuario.dart';

class Paciente {
  final int id;
  final String nome;
  final String cpf;
  final String rg;
  final String email;
  final String telefone;
  final String origemPaciente;
  Endereco endereco;
  Usuario usuario;

  Paciente({
    this.id,
    @required this.nome,
    @required this.cpf,
    @required this.email,
    @required this.rg,
    @required this.telefone,
    @required this.endereco,
    @required this.usuario,
    @required this.origemPaciente,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      email: json['email'],
      rg: json['rg'],
      telefone: json['telefone'],
      origemPaciente: json['origemPaciente'],
      endereco:
          json['endereco'] != null ? Endereco.fromJson(json['endereco']) : null,
      usuario: Usuario.fromJson(json['usuario']),
    );
  }
}
