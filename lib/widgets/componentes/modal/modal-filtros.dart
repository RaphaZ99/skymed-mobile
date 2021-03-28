import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';
import 'item-modal.dart';

class ModalFiltros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Filtros'),
            IconButton(
              padding: EdgeInsets.only(
                left: 165.0,
              ),
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        content: Container(
          width: 300.0,
          height: 400.0,
          child: ListView(
            children: [
              Campo(titulo: 'Nome do médico'),
              Campo(
                titulo: 'Especialidade',
                margem: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Campo(
                titulo: 'Hospital/Clínica',
                margem: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Campo(
                titulo: 'Cidade',
                margem: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Botao(
                titulo: 'Buscar',
                callback: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
