import 'package:flutter/material.dart';
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

DateTime convertDDMMYYYYToDateTime(String dateTime) {
  return DateFormat("dd/MM/yyyy").parse(dateTime);
}

DateTime convertDDMMYYYYHHMMToDateTime(String dateTime) {
  return DateFormat("dd/MM/yyyy hh:mm").parse(dateTime);
}

String convertDateTimeToLongFormat(DateTime dateTime) {
  return DateFormat.yMMMMEEEEd('pt_BR').format(dateTime);
}

TimeOfDay convertStringToTimeOfDay(String time) {
  return TimeOfDay(
    hour: int.parse(time.split(":")[0]),
    minute: int.parse(time.split(":")[1].split(" ")[0]),
  );
}

String convertTimeOfDayToString(TimeOfDay time) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  final format = DateFormat.Hm();
  return format.format(dt);
}
