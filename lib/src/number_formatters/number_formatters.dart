import 'package:intl/intl.dart';

numberFormated(double valor) {
  final formatadorValor = NumberFormat(
    '###,###,##0.00',
    Intl.defaultLocale,
  );
  return formatadorValor.format(
    valor,
  );
}
