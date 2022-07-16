import 'package:intl/intl.dart';

numberFormated(double valor) {
  final formatadorValor = NumberFormat(
    '###,###,##0.00',
    Intl.defaultLocale,
  );
  return formatadorValor
      .format(
        valor,
      )
      .trim();
}

numberInStringWithDecimalCommaStringWithDecimalPoint(String? value) {
  String newValue = value ?? '0';
  var indexOfDecimalBegin = value!.indexOf(',');
  if (indexOfDecimalBegin != -1) {
    var intValue = value
        .substring(0, indexOfDecimalBegin)
        .replaceAll('.', ',')
        .trim()
        .replaceAll(',', '');
    newValue = '$intValue.${value.substring(indexOfDecimalBegin + 1)}';
  }
  return newValue;
}
