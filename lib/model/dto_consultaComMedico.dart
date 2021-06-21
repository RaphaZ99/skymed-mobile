import 'package:skymed_mobile/model/dto_medicoComHospital.dart';

import 'horario_consulta.dart';

class DTOConsultaComMedico {
  HorarioConsulta horarioConsulta;
  DTOMedicoComHospital medico;

  DTOConsultaComMedico({
    this.horarioConsulta,
    this.medico,
  });
}
