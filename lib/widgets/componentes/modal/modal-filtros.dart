import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/dto_filtros_medico.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/campo.dart';

class ModalFiltros extends StatelessWidget {
  final controllerNomeMedico = TextEditingController();
  final controllerEspecialidade = TextEditingController();
  final controllerHospital = TextEditingController();
  final controllerCidade = TextEditingController();

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
              Campo(
                titulo: 'Nome do médico',
                controller: this.controllerNomeMedico,
              ),
              Campo(
                titulo: 'Especialidade',
                controller: this.controllerEspecialidade,
                margem: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Campo(
                titulo: 'Hospital/Clínica',
                controller: this.controllerHospital,
                margem: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Campo(
                titulo: 'Cidade',
                controller: this.controllerCidade,
                margem: EdgeInsets.only(
                  top: 15,
                ),
              ),
              Botao(
                titulo: 'Buscar',
                callback: () {
                  var filtros = new DTOFiltrosMedico();

                  if (this.controllerNomeMedico.text.isNotEmpty) {
                    filtros.nome = this.controllerNomeMedico.text;
                  }

                  if (this.controllerCidade.text.isNotEmpty) {
                    filtros.cidade = this.controllerCidade.text;
                  }

                  if (this.controllerHospital.text.isNotEmpty) {
                    filtros.hospital = this.controllerHospital.text;
                  }

                  if (this.controllerEspecialidade.text.isNotEmpty) {
                    filtros.especialidade = this.controllerEspecialidade.text;
                  }

                  bool pesquisouAlgum =
                      this.controllerNomeMedico.text.isNotEmpty ||
                          this.controllerCidade.text.isNotEmpty ||
                          this.controllerHospital.text.isNotEmpty ||
                          this.controllerEspecialidade.text.isNotEmpty;

                  Navigator.pop(context, pesquisouAlgum ? filtros : null);
                },
              )
            ],
          ),
        ));
  }
}
