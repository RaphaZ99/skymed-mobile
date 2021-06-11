import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/endereco.dart';
import 'package:skymed_mobile/model/usuario.dart';

class Paciente {
  final String id;
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
}
