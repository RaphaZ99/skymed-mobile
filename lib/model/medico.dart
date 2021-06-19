import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/especialidade.dart';
import 'package:skymed_mobile/model/paciente.dart';

class Medico {
  final int id;
  Paciente pessoa;
  //Hospital hospital;
  Especialidade especialidade;

  Medico({
    this.id,
    @required this.pessoa,
    @required this.especialidade,
    //@required this.hospital,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      id: json['id'],
      pessoa: Paciente.fromJson(json['pessoa']),
      especialidade: Especialidade.fromJson(json['especialidade']),
      //hospital: Hospital.fromJson(json['hospital']),
    );
  }
}
