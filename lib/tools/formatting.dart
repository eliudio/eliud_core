import 'package:intl/intl.dart';

String getVerboseDateTimeRepresentation(DateTime dateTime) {
  var now = DateTime.now();
  var justNow = now.subtract(Duration(minutes: 1));
  var localDateTime = dateTime.toLocal();
  if (!localDateTime.difference(justNow).isNegative) {
    return 'Just now';
  }
  var roughTimeString = DateFormat('jm').format(dateTime);
  if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
    return roughTimeString;
  }
  var yesterday = now.subtract(Duration(days: 1));
  if (localDateTime.day == yesterday.day && localDateTime.month == now.month && localDateTime.year == now.year) {
    return 'Yesterday';
  }
  if (now.difference(localDateTime).inDays < 4) {
    var weekday = DateFormat('EEEE').format(localDateTime);
    return '$weekday, $roughTimeString';
  }
  return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
}
