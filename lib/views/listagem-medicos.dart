import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/dto_filtros_medico.dart';
import 'package:skymed_mobile/model/dto_medicoComHospital.dart';
import 'package:skymed_mobile/provider/medicos.dart';
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
  Future<List<DTOMedicoComHospital>> futureMedico;

  @override
  void initState() {
    super.initState();
    futureMedico = new Medicos().obtenhaMedicos(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTopo(),
      body: FutureBuilder<List<DTOMedicoComHospital>>(
          future: futureMedico,
          builder: (context, medicos) {
            if (medicos.hasError) print(medicos.error);

            if (!medicos.hasData) {
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
                                    futureMedico =
                                        new Medicos().obtenhaMedicos(filtros);
                                  }
                                }));
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
                            ).then((value) => setState(() {
                                  futureMedico =
                                      new Medicos().obtenhaMedicos(value);
                                }));
                          },
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: medicos.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardMedico(medicos.data[index]);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
