import 'package:intl/intl.dart';
import 'package:time_elapsed/time_elapsed.dart';

getDateAndHourADate({required DateTime dateTime}) {
  final customDate = CustomTimeElapsed(
    minutes: 'minutos',
    hours: 'horas',
    days: 'dias',
    now: 'agora',
    seconds: 'segundos',
    weeks: 'semanas',
  );

  String timeStamp =
      TimeElapsed.fromDateTime(dateTime).toCustomTimeElapsed(customDate);
  if (timeStamp.contains('agora')) {
    return timeStamp.trim();
  }
  return '$timeStamp atrás';
}

hourAndMinuteFormatted(DateTime dateTime) {
  final dateTimeFormatter = DateFormat.Hm(
    Intl.defaultLocale,
  );
  return dateTimeFormatter.format(
    dateTime,
  );
}
