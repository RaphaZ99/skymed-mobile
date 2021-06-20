import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skymed_mobile/model/dto_filtros_medico.dart';
import 'package:skymed_mobile/model/medico.dart';
import 'package:skymed_mobile/provider/base_http.dart';

class Medicos with ChangeNotifier {
  final _baseHttp = new BaseHttp();

  Future<bool> agendeConsulta(Medico medico) async {
    final medicoJson = jsonEncode(medico);
    final resposta = await _baseHttp.putAutenticado(
        medicoJson, Uri.parse('${BaseHttp.baseUrl}/medico'));

    return resposta.statusCode == 200;
  }

  Future<List<Medico>> obtenhaMedicos(DTOFiltrosMedico filtros) async {
    final resposta =
        await _baseHttp.getPadrao(Uri.parse('${BaseHttp.baseUrl}/medico'));

    return convertaMedicos(resposta.body, filtros);
  }

  List<Medico> convertaMedicos(String body, DTOFiltrosMedico filtros) {
    var medicos = jsonDecode(body).cast<Map<String, dynamic>>();

    var listaMedicos =
        medicos.map<Medico>((json) => Medico.fromJson(json)).toList();

    if (filtros != null) {
      return filtreMedicos(filtros, listaMedicos);
    }

    return listaMedicos;
  }

  List<Medico> filtreMedicos(DTOFiltrosMedico filtros, List<Medico> medicos) {
    if (filtros.cidade != null) {
      medicos = medicos
          .where(
              (m) => m.pessoa.endereco?.localidade?.startsWith(filtros.cidade))
          .toList();
    }

    if (filtros.especialidade != null) {
      medicos = medicos
          .where((m) => m.especialidade.nome.startsWith(filtros.especialidade))
          .toList();
    }

    if (filtros.hospital != null) {
      //apos ajuste de hospital
    }

    if (filtros.nome != null) {
      medicos =
          medicos.where((m) => m.pessoa.nome.startsWith(filtros.nome)).toList();
    }

    if (filtros.ordem != null) {
      if (filtros.ordem == OrdemMedicos.cidade) {
        medicos.sort((a, b) => a.pessoa.endereco?.localidade
            ?.compareTo(b.pessoa.endereco?.localidade));
      }
      if (filtros.ordem == OrdemMedicos.especialidade) {
        medicos.sort(
            (a, b) => a.especialidade.nome.compareTo(b.especialidade.nome));
      }
      if (filtros.ordem == OrdemMedicos.nomeMedico) {
        medicos.sort((a, b) => a.pessoa.nome.compareTo(b.pessoa.nome));
      }
    }

    return medicos;
  }
}
