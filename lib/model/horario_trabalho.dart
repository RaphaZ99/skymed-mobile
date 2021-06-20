import 'package:flutter/cupertino.dart';

class HorarioTrabalho {
  final int id;
  final DateTime inicio;
  final DateTime fim;
  final int diaDaSemana;

  HorarioTrabalho({
    @required this.id,
    @required this.inicio,
    @required this.fim,
    @required this.diaDaSemana,
  });

  factory HorarioTrabalho.fromJson(Map<String, dynamic> json) {
    return HorarioTrabalho(
      id: json['id'],
      inicio: DateTime.parse(json['inicio']).toLocal(),
      fim: DateTime.parse(json['fim']).toLocal(),
      diaDaSemana: json['diaDaSemana'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      'inicio': inicio.toIso8601String(),
      'fim': fim.toIso8601String(),
      'diaDaSemana': diaDaSemana,
    };
  }
}
