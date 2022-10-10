import 'package:eca_packages/src/date_and_time/formated_datetime.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

bool isNotEmptyValidator(String value) {
  return value.isNotEmpty;
}

bool isMoreThanOneWordValidator(String value) {
  return value.split(' ').length > 2;
}

bool isMinMaxLengthValidator(String value, int minLength,
    {int? maxLength, bool acceptEmpty = false}) {
  if (acceptEmpty && value.isEmpty) {
    return true;
  }
  bool result = true;
  if (value.trim().length < minLength) {
    result = false;
  }
  print(value.trim().length);
  if (result && maxLength != null && value.trim().length > maxLength) {
    result = false;
  }
  return result;
}

bool isAValidEmailValidator(String value) {
  if (!isNotEmptyValidator(value)) return false;

  String pattern =
      r"^[a-zA-Z0-9_.-]+@gmail\.com|[a-zA-Z0-9_.-]+@alunos\.utfpr\.edu\.br|[a-zA-Z0-9_.-]+@hotmail\.com|[a-zA-Z0-9_.-]+@outlook\.com|[a-zA-Z0-9_.-]+@com\.br|[a-zA-Z0-9_.-]+@utfpr\.edu\.br|[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+\.[c][o][m]$|[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]|[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]";
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value));
}

//String pattern = r"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+\.[c][o][m]$";
bool isGreaterThenValue({
  required String value,
  required dynamic min,
}) {
  if (value.isEmpty) return false;
  if (min.runtimeType == double) {
    return (convertCommaToPointValue(value: value) > min);
  } else if (min.runtimeType == DateTime) {
    try {
      return (convertDDMMYYYYToDateTime(value).isAfter(min));
    } catch (e) {
      return false;
    }
  }
  return false;
}

bool isGreaterAndEqualThenValue({
  required String value,
  required dynamic min,
}) {
  if (value.isEmpty) return false;
  if (min.runtimeType == double) {
    return isGreaterThenValue(value: value, min: ++min);
  } else if (min.runtimeType == DateTime) {
    try {
      return isGreaterThenValue(
        value: value,
        min: convertDDMMYYYYToDateTime(value).add(
          Duration(days: 1),
        ),
      );
    } catch (e) {
      return false;
    }
  }
  return false;
}

bool isLessThenValue({
  required String value,
  required dynamic max,
}) {
  if (value.isEmpty) return false;
  if (max.runtimeType == double) {
    return (convertCommaToPointValue(value: value) < max);
  } else if (max.runtimeType == DateTime) {
    try {
      return (convertDDMMYYYYToDateTime(value).isBefore(max));
    } catch (e) {
      return false;
    }
  }
  return false;
}

//TODO Separar por categoria
bool isHourGreaterThenValue(
    {required String first,
    required String last,
    int minutesToAddAfterFirst = 60}) {
  if (!isAValidHour(first) || !isAValidHour(last)) {
    return false;
  }

  final firstTime = (convertStringToTimeOfDay(first).hour) +
      (convertStringToTimeOfDay(first).minute / 60);
  final lastTime = (convertStringToTimeOfDay(last).hour) +
      ((convertStringToTimeOfDay(last).minute + (minutesToAddAfterFirst - 1)) /
          60);

  return lastTime > firstTime;
  // return (convertDDMMYYYYHHMMToDateTime('20/05/2022 $last').isAfter(
  //   convertDDMMYYYYHHMMToDateTime('20/05/2022 $first').add(
  //     Duration(minutes: minutesToAddAfterFirst - 1),
  //   ),
  // ));
}

bool isHourLessThenValue({required String first, required String last}) {
  if (!isAValidHour(first) || !isAValidHour(last)) {
    return false;
  }

  final firstTime = (convertStringToTimeOfDay(first).hour) +
      (convertStringToTimeOfDay(first).minute / 60);
  final lastTime = (convertStringToTimeOfDay(last).hour) +
      (convertStringToTimeOfDay(last).minute / 60);

  return firstTime < lastTime;
}

bool isMatchValidator({required String value, required String otherValue}) {
  if (value != otherValue) return false;
  return true;
}

bool isAValidDate(String value) {
  initializeDateFormatting();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  try {
    var parsedDate = DateFormat('dd/MM/yyyy', 'pt_BR').parse(value);
    return formatter.format(parsedDate) == value;
  } on Exception catch (_) {
    return false;
  }
}

bool isNotAMinor(String value) {
  initializeDateFormatting();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  try {
    var parsedDate = DateFormat('dd/MM/yyyy', 'pt_BR').parse(value);
    return (DateTime.now().year - parsedDate.year) >= 18;
  } on Exception catch (_) {
    return false;
  }
}

bool isAValidHour(String value) {
  initializeDateFormatting();
  if (value.length < 5) {
    return false;
  }
  var strDate = '15/08/2022 $value';
  final DateFormat formatter =
      DateFormat('dd/MM/yyyy HH:mm'); //TODO Ver necessidade da variável
  try {
    var parsedDate = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').parse(strDate);
    return formatter.format(parsedDate) == strDate;
  } on Exception catch (_) {
    return false;
  }
}

convertCommaToPointValue({required String value}) {
  if (value.runtimeType == String) {
    value = value.replaceAll('.', '');
    value = value.replaceAll(',', '.');
    return double.tryParse(value.trim()) ?? 0;
  }
  return value;
}

bool isAValidCellPhoneValidator(String cellPhone) {
  return removeSpecialCaracteres(value: cellPhone, regExp: r'[\+\- ()]')
          .length ==
      11;
}

String removeSpecialCaracteres(
    {required String value, required String regExp}) {
  return value.replaceAll(RegExp(regExp), '');
}

bool isAIP4Address(String value) {
  final RegExp ipExp = RegExp(
      r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$",
      caseSensitive: false,
      multiLine: false);
  return ipExp.hasMatch(value);
}
