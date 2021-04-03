import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';

class ModalConfirmacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          'Deseja realmente cancelar essa consulta?',
          style: TextStyle(
            fontSize: 22.0,
          ),
          textAlign: TextAlign.center,
        ),
        content: Container(
          width: 250.0,
          height: 180.0,
          child: ListView(
            children: [
              Botao(
                titulo: 'Confirmar',
                callback: () {
                  Navigator.pop(context);
                },
              ),
              Botao(
                titulo: 'Cancelar',
                corBorda: Colors.red,
                corInterna: Colors.white,
                corLetra: Colors.black,
                callback: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
