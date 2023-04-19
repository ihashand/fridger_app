import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  CalendarWidgetState createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selectedDate;
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dates = _getDates(_selectedDate);
  }

  List<DateTime> _getDates(DateTime selectedDate) {
    final List<DateTime> dates = <DateTime>[];

    // add previous 2 days
    for (int i = 2; i >= 1; i--) {
      dates.add(selectedDate.subtract(Duration(days: i)));
    }

    // add selected day
    dates.add(selectedDate);

    // add next 2 days
    for (int i = 1; i <= 2; i++) {
      dates.add(selectedDate.add(Duration(days: i)));
    }

    return dates;
  }

  Future<void> _selectDate(DateTime date) async {
    if (_selectedDate == date) {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
      setState(() {
        _selectedDate = picked ?? _selectedDate;
        _dates = _getDates(_selectedDate);
      });
    } else {
      setState(() {
        _selectedDate = date;
        _dates = _getDates(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('EEE\n d');
    final List<Widget> dateWidgets = <Widget>[];

    for (int i = 0; i < _dates.length; i++) {
      final bool isSelected = _selectedDate == _dates[i];

      dateWidgets.add(
        GestureDetector(
          onTap: () async => await _selectDate(_dates[i]),
          child: Column(
            children: <Widget>[
              Text(
                formatter.format(_dates[i]),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dateWidgets,
      ),
    );
  }
}
