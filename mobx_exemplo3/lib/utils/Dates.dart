import 'package:intl/intl.dart';

class Dates {
  static final DateFormat formatter = DateFormat("dd/MM/yyyy");

  static String formatDate(DateTime date) {
    return formatter.format(date);
  }

  static DateTime parse(String date) {
    return formatter.parse(date);
  }
}
