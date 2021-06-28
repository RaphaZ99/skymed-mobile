import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/dto_consultaComMedico.dart';
import 'package:skymed_mobile/model/dto_filtros_medico.dart';
import 'package:skymed_mobile/provider/medicos.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/barra_topo.dart';
import 'package:skymed_mobile/widgets/componentes/listagem/botao-filtro.dart';
import 'package:skymed_mobile/widgets/componentes/listagem/card-consulta.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-ordenacao.dart';

class WidgetHistoricoConsultas extends StatefulWidget {
  @override
  _WidgetHistoricoConsultasState createState() =>
      _WidgetHistoricoConsultasState();
}

class _WidgetHistoricoConsultasState extends State<WidgetHistoricoConsultas> {
  Future<List<DTOConsultaComMedico>> future;

  @override
  void initState() {
    super.initState();
    future = new Medicos().obtenhaConsultasPacienteLogado(null);
  }

  void funcaoState() {
    setState(() {
      future = new Medicos().obtenhaConsultasPacienteLogado(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTopo(),
      body: FutureBuilder<List<DTOConsultaComMedico>>(
          future: future,
          builder: (context, consultasComMedico) {
            if (consultasComMedico.hasError) print(consultasComMedico.error);

            if (!consultasComMedico.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 15.0,
              ),
              child: Column(
                children: [
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
                            ).then((value) => setState(() {
                                  if (value != null) {
                                    var filtros =
                                        new DTOFiltrosMedico(ordem: value);
                                    future = new Medicos()
                                        .obtenhaConsultasPacienteLogado(
                                            filtros);
                                  }
                                }));
                          },
                        ),
                        margin: EdgeInsets.only(
                          right: 60.0,
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: consultasComMedico.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardConsulta(
                          consultasComMedico.data[index], funcaoState);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
