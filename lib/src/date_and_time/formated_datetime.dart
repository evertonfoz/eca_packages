import 'package:intl/intl.dart';

hourAndMinuteFormatted(DateTime dateTime) {
  final dateTimeFormatter = DateFormat.Hm(
    Intl.defaultLocale,
  );
  return dateTimeFormatter.format(
    dateTime,
  );
}

dayMonthAndYearFormatted(DateTime dateTime) {
  final dateTimeFormatter = DateFormat('dd/MM/yyyy');
  return dateTimeFormatter.format(dateTime);
}
