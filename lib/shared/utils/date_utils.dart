import 'package:intl/intl.dart';

class MyDateUtils {
  static String format(DateTime dateTime, {String? format = "dd-MM-yyyy"}) {
    DateFormat formatter = DateFormat(format);
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
}
