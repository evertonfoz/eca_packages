import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

bool isNotEmptyValidator(String value) {
  return value.isNotEmpty;
}

bool isAValidEmailValidator(String value) {
  if (!isNotEmptyValidator(value)) return false;

  String pattern = r"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9_-]+\.[a-zA-Z-]+";
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value));
}

bool isGreaterThenValue({
  required String value,
  required dynamic min,
}) {
  if (value.isEmpty) return false;
  if (min.runtimeType == double) {
    return (convertCommaToPointValue(value: value) > min);
  }
  return false;
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

convertCommaToPointValue({required String value}) {
  if (value.runtimeType == String) {
    value = value.replaceAll('.', '');
    value = value.replaceAll(',', '.');
    return double.tryParse(value.trim()) ?? 0;
  }
  return value;
}
