import 'package:flutter/foundation.dart';
import 'package:money_expense/helpers/date_helper.dart';

class DateData extends ChangeNotifier {
  String _selectedDate = '';

  final _dayName = DateHelper.dayName;

  final _monthName = DateHelper.monthName;

  void setDate(weekday, day, month, year) {
    _selectedDate = '${_dayName[weekday]}, $day ${_monthName[month]} $year';
    notifyListeners();
  }

  String getDateString(date) {
    var dateString;
    if (DateHelper.checkIfToday(date)) {
      dateString = 'Hari ini';
    } else if (DateHelper.checkIfYesterday(date)) {
      dateString = 'Kemarin';
    } else {
      dateString = date;
    }
    return dateString;
  }

  String getOrderFromDateString(dateString) {
    List<String> a = dateString.split(' ');
    var month;
    _monthName.forEach((key, value) {
      if (value == a[2]) {
        month = key;
      }
    });
    var total = int.parse(a[1]) + month + int.parse(a[3]);
    return '$total';
  }

  String get date {
    return _selectedDate;
  }
}
