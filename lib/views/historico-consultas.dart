import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/barra_topo.dart';
import 'package:skymed_mobile/widgets/componentes/listagem/botao-filtro.dart';
import 'package:skymed_mobile/widgets/componentes/listagem/card-consulta.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-ordenacao.dart';
import 'package:skymed_mobile/widgets/componentes/padroes/voltar-padrao.dart';

class WidgetHistoricoConsultas extends StatefulWidget {
  @override
  _WidgetHistoricoConsultasState createState() =>
      _WidgetHistoricoConsultasState();
}

class _WidgetHistoricoConsultasState extends State<WidgetHistoricoConsultas> {
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
                left: 95.0,
                right: 95.0,
              ),
            ),
            CardConsulta(
              nomeCidade: 'Goiânia-GO',
              nomeEspecialidade: 'Podologia',
              nomeHospital: 'Hospital SkyMed',
              nomeMedico: 'João da Silva',
              dataConsulta: '05/04/2021 08:00',
            ),
            CardConsulta(
              nomeCidade: 'Goiânia-GO',
              nomeEspecialidade: 'Podologia',
              nomeHospital: 'Hospital SkyMed',
              nomeMedico: 'João da Silva',
              dataConsulta: '05/04/2021 08:00',
            ),
            CardConsulta(
              nomeCidade: 'Goiânia-GO',
              nomeEspecialidade: 'Podologia',
              nomeHospital: 'Hospital SkyMed',
              nomeMedico: 'João da Silva',
              dataConsulta: '05/04/2021 08:00',
            ),
            CardConsulta(
              nomeCidade: 'Goiânia-GO',
              nomeEspecialidade: 'Podologia',
              nomeHospital: 'Hospital SkyMed',
              nomeMedico: 'João da Silva',
              dataConsulta: '05/04/2021 08:00',
            ),
            BotaoVoltarPadrao(
              margem: EdgeInsets.only(
                top: 105,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
