import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-confirmacao.dart';

class CardConsulta extends StatelessWidget {
  CardConsulta(
      {this.nomeMedico,
      this.nomeHospital,
      this.nomeCidade,
      this.nomeEspecialidade,
      this.dataConsulta,
      this.imagem});

  final String nomeMedico;
  final String nomeHospital;
  final String nomeCidade;
  final String nomeEspecialidade;
  final Widget imagem;
  final String dataConsulta;

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
            );
          },
        ),
        title: Text(
          this.dataConsulta,
          textAlign: TextAlign.center,
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(this.nomeMedico),
                Text(this.nomeEspecialidade),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(this.nomeHospital),
                Text(this.nomeCidade),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
