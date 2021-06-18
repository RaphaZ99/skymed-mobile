import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skymed_mobile/model/medico.dart';
import 'package:skymed_mobile/provider/base_http.dart';

class Medicos with ChangeNotifier {
  final _baseHttp = new BaseHttp();

  Future<List<Medico>> obtenhaMedicos() async {
    final resposta =
        await _baseHttp.getPadrao(Uri.parse('${BaseHttp.baseUrl}/medico'));

    return compute(convertaMedicos, resposta.body);
  }

  List<Medico> convertaMedicos(String body) {
    var medicos = jsonDecode(body).cast<Map<String, dynamic>>();

    return medicos.map<Medico>((json) => Medico.fromJson(json)).toList();
  }
}
