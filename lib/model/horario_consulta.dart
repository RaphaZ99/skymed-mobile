import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/paciente.dart';

class HorarioConsulta {
  final int id;
  final DateTime inicio;
  final DateTime fim;
  final Paciente paciente;

  HorarioConsulta({
    this.id,
    @required this.inicio,
    @required this.fim,
    @required this.paciente,
  });

  factory HorarioConsulta.fromJson(Map<String, dynamic> json) {
    return HorarioConsulta(
      id: json['id'],
      inicio: DateTime.parse(json['inicio']).toLocal(),
      fim: DateTime.parse(json['fim']).toLocal(),
      paciente: Paciente.fromJson(json['paciente']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      'inicio': inicio.toIso8601String(),
      'fim': fim.toIso8601String(),
      'paciente': this.paciente,
    };
  }
}
