import 'package:intl/intl.dart';

String convertTime(String time24) {
  // Define a DateFormat for the 24-hour time string
  final DateFormat format24 = DateFormat("HH:mm");

  // Parse the 24-hour time string to a DateTime object
  DateTime dateTime = format24.parse(time24);

  // Define a DateFormat for the 12-hour time string with AM/PM
  final DateFormat format12 = DateFormat("hh:mm a");

  // Format the DateTime object to the desired 12-hour time string
  String time12 = format12.format(dateTime);

  return time12;
}
