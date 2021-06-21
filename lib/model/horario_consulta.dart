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
    var inicioSemLocal = DateTime.parse(json['inicio']);
    var fimSemLocal = DateTime.parse(json['fim']);
    var inicioComLocal = inicioSemLocal.toLocal();
    var fimComLocal = fimSemLocal.toLocal();

    return HorarioConsulta(
      id: json['id'],
      inicio: inicioComLocal,
      fim: fimComLocal,
      paciente: Paciente.fromJson(json['paciente']),
    );
  }

  Map<String, dynamic> toJson() {
    var inicioUtc = inicio.toUtc();
    var fimUtc = fim.toUtc();
    var inicioIso = inicioUtc.toIso8601String();
    var fimIso = fimUtc.toIso8601String();

    return {
      if (this.id != null) 'id': this.id,
      'inicio': inicioIso,
      'fim': fimIso,
      'paciente': this.paciente,
    };
  }
}
