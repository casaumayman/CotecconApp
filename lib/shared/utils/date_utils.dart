class MyDateUtils {
  static String format(DateTime dateTime) {
    String formattedDate =
        '${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year.toString()}';
    return formattedDate;
  }
}
