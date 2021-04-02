import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/barra_topo.dart';
import 'package:skymed_mobile/widgets/componentes/listagem/botao-filtro.dart';
import 'package:skymed_mobile/widgets/componentes/listagem/card-medico.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-filtros.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-ordenacao.dart';

class WidgetListagemMedicos extends StatefulWidget {
  @override
  _WidgetListagemMedicosState createState() => _WidgetListagemMedicosState();
}

class _WidgetListagemMedicosState extends State<WidgetListagemMedicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTopo(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 15.0,
        ),
        child: ListView(
          children: [
            Container(
              child: Text('Goiânia, Goiás'),
              margin: EdgeInsets.only(
                bottom: 15.0,
              ),
            ),
            Row(
              children: [
                Container(
                  child: BotaoFiltro(
                    titulo: 'Ordenar',
                    icone: Icon(Icons.arrow_drop_down),
                    callback: () {
                      showDialog(
                        context: context,
                        builder: (context) => ModalOrdenacao(),
                      );
                    },
                  ),
                  margin: EdgeInsets.only(
                    right: 60.0,
                  ),
                ),
                Container(
                  child: BotaoFiltro(
                    titulo: 'Filtros',
                    icone: Icon(Icons.filter_alt),
                    callback: () {
                      showDialog(
                        context: context,
                        builder: (context) => ModalFiltros(),
                      );
                    },
                  ),
                ),
              ],
            ),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
            CardMedico(
                nomeCidade: 'Goiânia-GO',
                nomeEspecialidade: 'Podologia',
                nomeHospital: 'Hospital SkyMed',
                nomeMedico: 'João da Silva'),
          ],
        ),
      ),
    );
  }
}
