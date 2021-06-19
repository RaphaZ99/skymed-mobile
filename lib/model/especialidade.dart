import 'package:flutter/cupertino.dart';

class Especialidade {
  final DateTime duracaoConsulta;
  final String nome;
  final double preco;

  Especialidade({
    @required this.duracaoConsulta,
    @required this.nome,
    @required this.preco,
  });

  factory Especialidade.fromJson(Map<String, dynamic> json) {
    return Especialidade(
      duracaoConsulta: DateTime.parse(json['duracaoConsulta']),
      nome: json['nome'],
      preco: json['preco'],
    );
  }
}
