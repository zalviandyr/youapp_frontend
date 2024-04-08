import 'package:intl/intl.dart';

class Horoscope {
  static const List<List<String>> _values = [
    ['Aries', 'March 21', 'April 19'],
    ['Taurus', 'April 20', 'May 20'],
    ['Gemini', 'May 21', 'June 21'],
    ['Cancer', 'June 22', 'July 22'],
    ['Leo', 'July 23', 'August 22'],
    ['Virgo', 'August 23', 'September 22'],
    ['Libra', 'September 23', 'October 23'],
    ['Scorpius', 'October 24', 'November 21'],
    ['Sagittarius', 'November 22', 'December 21'],
    ['Capricornus', 'December 22', 'January 19'],
    ['Aquarius', 'January 20', 'February 18'],
    ['Pisces', 'February 19', 'March 20'],
  ];

  static String getByDate(DateTime date) {
    DateFormat format = DateFormat('MMMM dd');
    DateTime monthDate = DateTime(1970, date.month, date.day);

    for (List<String> horoscope in _values) {
      DateTime start = format.parse(horoscope[1]);
      DateTime end = format.parse(horoscope[2]);

      if (monthDate.isAfter(start) && monthDate.isBefore(end)) {
        return horoscope[0];
      }
    }

    throw Exception('Invalid date');
  }
}
