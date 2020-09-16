class DateHelper {
  static final dayName = {
    1: 'Senin',
    2: 'Selasa',
    3: 'Rabu',
    4: 'Kamis',
    5: 'Jum\'at',
    6: 'Sabtu',
    7: 'Minggu',
  };

  static final monthName = {
    1: 'Januari',
    2: 'Februari',
    3: 'Maret',
    4: 'April',
    5: 'Mei',
    6: 'Juni',
    7: 'Juli',
    8: 'Agustus',
    9: 'September',
    10: 'Oktober',
    11: 'November',
    12: 'Desember',
  };

  static bool checkIfToday(date) {
    var _dt = DateTime.now();
    var today =
        '${dayName[_dt.weekday]}, ${_dt.day} ${monthName[_dt.month]} ${_dt.year}';
    return date == today;
  }

  static bool checkIfYesterday(date) {
    var _dt = DateTime.now();
    var yesterday =
        '${dayName[_dt.weekday - 1]}, ${_dt.day - 1} ${monthName[_dt.month]} ${_dt.year}';
    return date == yesterday;
  }
}
