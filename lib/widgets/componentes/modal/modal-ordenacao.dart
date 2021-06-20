import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/dto_filtros_medico.dart';
import 'item-modal.dart';

class ModalOrdenacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Ordenar por:'),
      children: [
        ItemModal(
          icon: Icons.medical_services,
          color: Colors.black,
          text: 'Nome do médico',
          onPressed: () {
            Navigator.pop(context, OrdemMedicos.nomeMedico);
          },
        ),
        ItemModal(
          icon: Icons.analytics_outlined,
          color: Colors.black,
          text: 'Especialidade',
          onPressed: () {
            Navigator.pop(context, OrdemMedicos.especialidade);
          },
        ),
        ItemModal(
          icon: Icons.location_city_rounded,
          color: Colors.black,
          text: 'Hospital/Clínica',
          onPressed: () {
            Navigator.pop(context, OrdemMedicos.hospital);
          },
        ),
        ItemModal(
          icon: Icons.location_on,
          color: Colors.black,
          text: 'Cidade',
          onPressed: () {
            Navigator.pop(context, OrdemMedicos.cidade);
          },
        ),
      ],
    );
  }
}
