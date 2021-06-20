import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/medico.dart';
import 'package:skymed_mobile/views/agendamento-consulta.dart';

class CardMedico extends StatelessWidget {
  CardMedico(this.medico, {this.imagem});

  final Medico medico;
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
                  builder: (context) => WidgetAgendamentoConsulta(this.medico)),
            );
          },
        ),
        title: Text(this.medico.pessoa.nome),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.medico.especialidade.nome),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Hospital'),
                Text(
                    '${this.medico.pessoa.endereco?.localidade}-${this.medico.pessoa.endereco?.uf}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
