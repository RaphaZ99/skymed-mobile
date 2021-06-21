import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'medico.dart';
import 'paciente.dart';

class Hospital {
  final int id;
  Paciente pessoa;
  final String cnpj;
  final String razaoSocial;
  List<Medico> medicos;

  Hospital({
    this.id,
    @required this.pessoa,
    @required this.cnpj,
    @required this.razaoSocial,
    this.medicos,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'],
      pessoa: Paciente.fromJson(json['pessoa']),
      cnpj: json['cnpj'],
      razaoSocial: json['razaoSocial'],
      medicos: json['medicos']
          .cast<Map<String, dynamic>>()
          .map<Medico>((json) => Medico.fromJson(json))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
      'pessoa': this.pessoa,
      'medicos': this.medicos,
    };
  }
}
