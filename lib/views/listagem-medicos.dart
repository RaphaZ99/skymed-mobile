import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/medico.dart';
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
  Future<List<Medico>> futureMedico;

  @override
  void initState() {
    super.initState();
    futureMedico = new Medicos().obtenhaMedicos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTopo(),
      body: FutureBuilder<List<Medico>>(
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
                  ListView.builder(
                    itemCount: medicos.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardMedico(
                          nomeCidade:
                              'Cidade-UF', //'${medicos[index].hospital.pessoa.endereco.localidade}-${medicos[index].hospital.pessoa.endereco.uf}',
                          nomeEspecialidade:
                              medicos.data[index].especialidade.nome,
                          nomeHospital:
                              'HospitalName', //medicos[index].hospital.razaoSocial,
                          nomeMedico: medicos.data[index].pessoa.nome);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
