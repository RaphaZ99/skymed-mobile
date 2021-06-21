import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skymed_mobile/model/dto_consultaComMedico.dart';
import 'package:skymed_mobile/model/dto_filtros_medico.dart';
import 'package:skymed_mobile/model/dto_medicoComHospital.dart';
import 'package:skymed_mobile/model/hospital.dart';
import 'package:skymed_mobile/model/medico.dart';
import 'package:skymed_mobile/provider/base_http.dart';

import 'pacientes.dart';

class Medicos with ChangeNotifier {
  final _baseHttp = new BaseHttp();

  Future<bool> agendeConsulta(Medico medico) async {
    final medicoJson = jsonEncode(medico);
    final resposta = await _baseHttp.putAutenticado(
        medicoJson, Uri.parse('${BaseHttp.baseUrl}/medico'));

    return resposta.statusCode == 200;
  }

  Future<bool> removaConsulta(int id) async {
    final resposta = await _baseHttp
        .deleteAutenticado(Uri.parse('${BaseHttp.baseUrl}/horario/$id'));

    return resposta.statusCode == 200;
  }

  Future<List<DTOMedicoComHospital>> obtenhaMedicos(
      DTOFiltrosMedico filtros) async {
    final respostaHospitais =
        await _baseHttp.getPadrao(Uri.parse('${BaseHttp.baseUrl}/hospital'));

    return convertaMedicos(respostaHospitais.body, filtros);
  }

  Future<List<DTOConsultaComMedico>> obtenhaConsultasPacienteLogado(
      DTOFiltrosMedico filtros) async {
    final todosMedicos = await obtenhaMedicos(filtros);
    final usuario = await Pacientes().obterUsuario();
    final List<DTOConsultaComMedico> consultas = [];

    todosMedicos.forEach((m) {
      m.medico.horariosConsulta.forEach((h) {
        if (h.paciente.usuario.id == usuario.id) {
          var consultaComMedico =
              DTOConsultaComMedico(horarioConsulta: h, medico: m);

          consultas.add(consultaComMedico);
        }
      });
    });

    return consultas;
  }

  List<DTOMedicoComHospital> convertaMedicos(
      String bodyHospitais, DTOFiltrosMedico filtros) {
    var hospitais = jsonDecode(bodyHospitais).cast<Map<String, dynamic>>();

    List<Hospital> listaHospitais =
        hospitais.map<Hospital>((json) => Hospital.fromJson(json)).toList();

    final List<DTOMedicoComHospital> listaMedicosComHospital = [];

    listaHospitais.forEach((hospital) {
      hospital.medicos.forEach((medico) {
        var novoHospital = Hospital(
            cnpj: hospital.cnpj,
            pessoa: hospital.pessoa,
            razaoSocial: hospital.razaoSocial,
            id: hospital.id);
        var dto = DTOMedicoComHospital(hospital: novoHospital, medico: medico);

        listaMedicosComHospital.add(dto);
      });
    });

    if (filtros != null) {
      return filtreMedicos(filtros, listaMedicosComHospital);
    }

    return listaMedicosComHospital;
  }

  List<DTOMedicoComHospital> filtreMedicos(
      DTOFiltrosMedico filtros, List<DTOMedicoComHospital> medicos) {
    if (filtros.cidade != null) {
      medicos = medicos
          .where((m) =>
              m.medico.pessoa.endereco?.localidade?.startsWith(filtros.cidade))
          .toList();
    }

    if (filtros.especialidade != null) {
      medicos = medicos
          .where((m) =>
              m.medico.especialidade.nome.startsWith(filtros.especialidade))
          .toList();
    }

    if (filtros.hospital != null) {
      medicos = medicos
          .where((m) => m.hospital.razaoSocial.startsWith(filtros.hospital))
          .toList();
    }

    if (filtros.nome != null) {
      medicos = medicos
          .where((m) => m.medico.pessoa.nome.startsWith(filtros.nome))
          .toList();
    }

    if (filtros.ordem != null) {
      if (filtros.ordem == OrdemMedicos.cidade) {
        medicos.sort((a, b) => a.hospital.pessoa.endereco?.localidade
            ?.compareTo(b.hospital.pessoa.endereco?.localidade));
      }
      if (filtros.ordem == OrdemMedicos.especialidade) {
        medicos.sort((a, b) =>
            a.medico.especialidade.nome.compareTo(b.medico.especialidade.nome));
      }
      if (filtros.ordem == OrdemMedicos.nomeMedico) {
        medicos.sort(
            (a, b) => a.medico.pessoa.nome.compareTo(b.medico.pessoa.nome));
      }
    }

    return medicos;
  }
}
