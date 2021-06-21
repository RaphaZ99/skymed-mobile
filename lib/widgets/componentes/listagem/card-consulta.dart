import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/dto_consultaComMedico.dart';
import 'package:skymed_mobile/provider/medicos.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-confirmacao.dart';
import 'package:intl/intl.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-erro.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-sucesso.dart';

class CardConsulta extends StatelessWidget {
  CardConsulta(this.dtoConsulta, {this.imagem});

  final DTOConsultaComMedico dtoConsulta;
  final Widget imagem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 25.0,
      ),
      child: ListTile(
        leading: Icon(
          Icons.person_search_outlined,
          size: 40.0,
        ),
        trailing: GestureDetector(
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ModalConfirmacao(),
            ).then((confirmacao) {
              if (confirmacao != null && confirmacao) {
                Medicos()
                    .removaConsulta(dtoConsulta.horarioConsulta.id)
                    .then((removeu) {
                  if (removeu != null && removeu) {
                    return showDialog(
                        context: context,
                        builder: (context) =>
                            ModalSucesso('Consulta cancelada com sucesso!'));
                  }

                  return showDialog(
                      context: context,
                      builder: (context) => ModalErro(
                          'Ocorreu um erro ao cancelar sua consulta!'));
                });
              }
            });
          },
        ),
        title: Text(
          DateFormat('dd/MM/yyyy HH:mm')
              .format(this.dtoConsulta.horarioConsulta.inicio),
          textAlign: TextAlign.center,
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(this.dtoConsulta.medico.medico.pessoa.nome),
                Text(this.dtoConsulta.medico.medico.especialidade.nome),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(this.dtoConsulta.medico.hospital.razaoSocial),
                Text(
                    '${this.dtoConsulta.medico.hospital.pessoa.endereco?.localidade}-${this.dtoConsulta.medico.hospital.pessoa.endereco?.uf}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
