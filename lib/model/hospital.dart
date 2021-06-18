import 'package:flutter/cupertino.dart';

import 'paciente.dart';

class Hospital {
  final String id;
  Paciente pessoa;
  final String cnpj;
  final String razaoSocial;

  Hospital({
    this.id,
    @required this.pessoa,
    @required this.cnpj,
    @required this.razaoSocial,
  });
}
