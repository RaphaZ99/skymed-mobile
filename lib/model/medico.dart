import 'package:flutter/cupertino.dart';
import 'package:skymed_mobile/model/especialidade.dart';
import 'package:skymed_mobile/model/hospital.dart';
import 'package:skymed_mobile/model/paciente.dart';

class Medico {
  final String id;
  Paciente pessoa;
  Hospital hospital;
  Especialidade especialidade;

  Medico({
    this.id,
    @required this.pessoa,
    @required this.especialidade,
    @required this.hospital,
  });
}
