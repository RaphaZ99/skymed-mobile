import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';

class ModalConsulta extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Informe o horário'),
            IconButton(
              padding: EdgeInsets.only(
                left: 55.0,
              ),
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        content: Container(
          width: 150.0,
          height: 150.0,
          child: ListView(
            children: [
              Campo(
                titulo: 'Horário',
                controller: controller,
              ),
              Botao(
                titulo: 'Confirmar',
                callback: () {
                  Navigator.pop(context, controller.text);
                },
              )
            ],
          ),
        ));
  }
}
