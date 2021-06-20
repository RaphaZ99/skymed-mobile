import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'paciente.dart';

class Hospital {
  final int id;
  Paciente pessoa;
  final String cnpj;
  final String razaoSocial;

  Hospital({
    this.id,
    @required this.pessoa,
    @required this.cnpj,
    @required this.razaoSocial,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'],
      pessoa: Paciente.fromJson(json['pessoa']),
      cnpj: json['cnpj'],
      razaoSocial: json['razaoSocial'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
      'pessoa': this.pessoa,
    };
  }
}
