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

DateTime convertDDMMYYToDateTime(String dateTime) {
  return DateFormat("dd/MM/yyyy").parse(dateTime);
}

String convertDateTimeToLongFormat(DateTime dateTime) {
  return DateFormat.yMMMMEEEEd().format(DateTime.now());
}
