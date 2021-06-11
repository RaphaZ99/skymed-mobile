import 'package:flutter/material.dart';
import 'package:skymed_mobile/widgets/componentes/app-bar/barra_topo.dart';
import 'package:skymed_mobile/widgets/componentes/card-campo/botao.dart';
import 'package:skymed_mobile/widgets/componentes/modal/modal-consulta.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

class WidgetAgendamentoConsulta extends StatefulWidget {
  WidgetAgendamentoConsulta({Key key}) : super(key: key);

  @override
  _AgendamentoConsultaState createState() => _AgendamentoConsultaState();
}

class _AgendamentoConsultaState extends State<WidgetAgendamentoConsulta>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3'
      ],
      _selectedDay.subtract(Duration(days: 27)): [
        'Consulta XPTO',
      ],
      _selectedDay.subtract(Duration(days: 20)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3',
        'Consulta XPTO 4'
      ],
      _selectedDay.subtract(Duration(days: 16)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
      ],
      _selectedDay.subtract(Duration(days: 10)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3'
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
      ],
      _selectedDay: [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3',
        'Consulta XPTO 4'
      ],
      _selectedDay.add(Duration(days: 1)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3',
        'Consulta XPTO 4'
      ],
      _selectedDay.add(Duration(days: 3)): Set.from([
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3',
      ]).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3'
      ],
      _selectedDay.add(Duration(days: 11)): [
        'Consulta XPTO',
        'Consulta XPTO 2'
      ],
      _selectedDay.add(Duration(days: 17)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3',
        'Consulta XPTO 4'
      ],
      _selectedDay.add(Duration(days: 22)): [
        'Consulta XPTO',
        'Consulta XPTO 2'
      ],
      _selectedDay.add(Duration(days: 26)): [
        'Consulta XPTO',
        'Consulta XPTO 2',
        'Consulta XPTO 3'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
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

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
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
            showDialog(
              context: context,
              builder: (context) => ModalConsulta(),
            );
          },
        ),
      ],
    );
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
