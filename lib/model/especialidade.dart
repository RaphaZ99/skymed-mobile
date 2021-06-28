import 'package:flutter/cupertino.dart';
import 'dart:convert' show utf8;

class Especialidade {
  final int id;
  final DateTime duracaoConsulta;
  final String nome;
  final double preco;

  Especialidade({
    this.id,
    @required this.duracaoConsulta,
    @required this.nome,
    @required this.preco,
  });

  factory Especialidade.fromJson(Map<String, dynamic> json) {
    return Especialidade(
      id: json['id'],
      duracaoConsulta: DateTime.parse(json['duracaoConsulta']),
      nome: json['nome'],
      preco: json['preco'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      'duracaoConsulta': duracaoConsulta.toUtc().toIso8601String(),
      'nome': utf8.decode(utf8.encode(nome)),
      'preco': preco,
    };
  }
}
