import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/especialidade.dart';
import 'package:skymed_mobile/model/horario_trabalho.dart';
import 'package:skymed_mobile/model/paciente.dart';

import 'horario_consulta.dart';

class Medico {
  final int id;
  Paciente pessoa;
  Especialidade especialidade;
  List<HorarioConsulta> horariosConsulta;
  List<HorarioTrabalho> horariosTrabalho;

  Medico({
    this.id,
    @required this.pessoa,
    @required this.especialidade,
    @required this.horariosConsulta,
    @required this.horariosTrabalho,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      id: json['id'],
      pessoa: Paciente.fromJson(json['pessoa']),
      especialidade: Especialidade.fromJson(json['especialidade']),
      horariosConsulta: json['horariosConsulta']
          .cast<Map<String, dynamic>>()
          .map<HorarioConsulta>((json) => HorarioConsulta.fromJson(json))
          .toList(),
      horariosTrabalho: json['horariosTrabalho']
          .cast<Map<String, dynamic>>()
          .map<HorarioTrabalho>((json) => HorarioTrabalho.fromJson(json))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    var pessoa = this.pessoa;
    var especialidade = this.especialidade;
    var horariosConsulta = this.horariosConsulta;
    var horariosTrabalho = this.horariosTrabalho;

    return {
      if (this.id != null) 'id': this.id,
      'pessoa': pessoa,
      'especialidade': especialidade,
      'horariosConsulta': horariosConsulta,
      'horariosTrabalho': horariosTrabalho,
    };
  }
}
