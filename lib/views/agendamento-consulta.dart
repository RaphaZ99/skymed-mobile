import 'package:flutter/material.dart';
import 'package:skymed_mobile/model/horario_consulta.dart';
import 'package:skymed_mobile/model/medico.dart';
import 'package:skymed_mobile/provider/medicos.dart';
import 'package:skymed_mobile/provider/pacientes.dart';
import 'package:skymed_mobile/views/historico-consultas.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/barra_topo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-consulta.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-erro.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0}) {
    return this.replacing(hour: this.hour + hour, minute: this.minute + minute);
  }
}

class WidgetAgendamentoConsulta extends StatefulWidget {
  WidgetAgendamentoConsulta(this.medico, {Key key}) : super(key: key);

  final Medico medico;

  @override
  _AgendamentoConsultaState createState() => _AgendamentoConsultaState(medico);
}

class _AgendamentoConsultaState extends State<WidgetAgendamentoConsulta>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  final Medico medico;

  _AgendamentoConsultaState(this.medico);

  @override
  void initState() {
    super.initState();

    _selectedEvents = [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {}

  int convertaDiaSemana(int dia) {
    if (dia == 0) return 7;

    if (dia == 7) return 6;

    return dia;
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTopo(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 30.0,
            ),
          ),
          _buildTableCalendar(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.black,
        todayColor: Colors.grey[300],
        todayStyle: TextStyle(
          color: Colors.black,
        ),
        markersColor: Colors.grey,
        weekendStyle: TextStyle(
          color: Colors.black,
        ),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mês',
      },
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        Botao(
          titulo: 'Agendar',
          corLetra: Colors.white,
          corInterna: Colors.black,
          margem: EdgeInsets.only(
            top: 30.0,
            bottom: 30.0,
          ),
          width: 0.8,
          callback: () {
            if (!medico.horariosTrabalho.any((h) =>
                convertaDiaSemana(h.diaDaSemana) ==
                _calendarController.selectedDay.weekday)) {
              showDialog(
                context: context,
                builder: (context) {
                  return ModalErro(
                      'O médico não trabalha nesse dia da semana!');
                },
              );

              return;
            }

            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then(
              (horarioEscolhido) {
                if (horarioEscolhido != null) {
                  var horarioInicial = TimeOfDay.fromDateTime(
                      medico.horariosTrabalho.first.inicio);
                  var horarioFinal =
                      TimeOfDay.fromDateTime(medico.horariosTrabalho.first.fim);
                  var horarioEscolhidoFim = horarioEscolhido.add(
                    hour: medico.especialidade.duracaoConsulta.hour,
                    minute: medico.especialidade.duracaoConsulta.minute,
                  );

                  if (!isBetween(
                          horarioEscolhido, horarioInicial, horarioFinal) ||
                      !isBetween(
                          horarioEscolhidoFim, horarioInicial, horarioFinal)) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return ModalErro(
                            'O médico apenas trabalha das ${horarioInicial.format(context)} às ${horarioFinal.format(context)}!');
                      },
                    );
                  }

                  if (medico.horariosConsulta.any((h) =>
                      sameDay(_calendarController.selectedDay, h.inicio) &&
                      isBetween(
                          horarioEscolhido,
                          TimeOfDay.fromDateTime(h.inicio),
                          TimeOfDay.fromDateTime(h.fim)))) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return ModalErro(
                            'O médico já possui uma consulta nesse horário!');
                      },
                    );
                  }

                  Pacientes().obterPaciente().then((pacienteLogado) {
                    var inicio = DateTime(
                        _calendarController.selectedDay.year,
                        _calendarController.selectedDay.month,
                        _calendarController.selectedDay.day,
                        horarioEscolhido.hour,
                        horarioEscolhido.minute);
                    var fim = inicio.add(Duration(
                        hours: medico.especialidade.duracaoConsulta.hour,
                        minutes: medico.especialidade.duracaoConsulta.minute));
                    var agendamento = HorarioConsulta(
                      paciente: pacienteLogado,
                      inicio: inicio,
                      fim: fim,
                    );

                    medico.horariosConsulta.add(agendamento);

                    Medicos().agendeConsulta(medico).then(
                      (deuCerto) {
                        if (!deuCerto) {
                          medico.horariosConsulta.removeLast();

                          return showDialog(
                            context: context,
                            builder: (context) {
                              return ModalErro('Ocorreu um erro ao agendar!');
                            },
                          );
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WidgetHistoricoConsultas()),
                        );
                      },
                    );
                  });
                }
              },
            );
          },
        ),
      ],
    );
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  bool isBetween(TimeOfDay day, TimeOfDay first, TimeOfDay second) {
    return toDouble(first) <= toDouble(day) &&
        toDouble(day) <= toDouble(second);
  }

  bool sameDay(DateTime first, DateTime second) {
    return first.day == second.day &&
        first.month == second.month &&
        first.year == second.year;
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
