class DateUtil {
  static String fromUtc(String dateUtc) {
    var dateTime = DateTime.parse(dateUtc);
    String res = dateTime.toLocal().toString();
    return res.substring(0, 11);
  }
}
