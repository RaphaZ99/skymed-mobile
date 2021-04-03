import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/views/agendamento-consulta.dart';

class CardMedico extends StatelessWidget {
  CardMedico(
      {this.nomeMedico,
      this.nomeHospital,
      this.nomeCidade,
      this.nomeEspecialidade,
      this.imagem});

  final String nomeMedico;
  final String nomeHospital;
  final String nomeCidade;
  final String nomeEspecialidade;
  final Widget imagem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 25.0,
      ),
      child: ListTile(
        leading: this.imagem ??
            Image.asset(
              'assets/images/icone-medico.png',
              fit: BoxFit.contain,
              height: 55,
            ),
        trailing: GestureDetector(
          child: Icon(Icons.assignment, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WidgetAgendamentoConsulta()),
            );
          },
        ),
        title: Text(this.nomeMedico),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.nomeEspecialidade),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(this.nomeHospital),
                Text(this.nomeCidade),
              ],
            )
          ],
        ),
      ),
    );
  }
}
