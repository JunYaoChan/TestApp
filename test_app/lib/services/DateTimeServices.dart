

import 'package:intl/intl.dart';

class TimeServices {

  static getSuffix (int day){
    if (day <1 || day > 31) {
      throw Exception("Invalid day of month");
    }

    if (day > 3 && day < 21) return 'th';

    switch (day % 10) {
      case 1:  return 'st';
      case 2:  return 'nd';
      case 3:  return 'rd';
      default: return 'th';
    }
  }

  static String nowAsString() {
    DateTime now = DateTime.now();
    int day = now.day;
    String suffix = getSuffix(day);

    String formattedDateStart = DateFormat('E dd').format(now);
    String formattedDateEnd = DateFormat('MMM, yyyy').format(now);

    String formattedDate = '$formattedDateStart$suffix $formattedDateEnd';
    return formattedDate;
  }

}