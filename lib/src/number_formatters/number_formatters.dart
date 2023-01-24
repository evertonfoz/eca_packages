// import 'package:intl/intl.dart';

// numberFormated(double valor) {
//   final formatadorValor = NumberFormat(
//     '###,###,##0.00',
//     Intl.defaultLocale,
//   );
//   return formatadorValor
//       .format(
//         valor,
//       )
//       .trim();
// }

// currencyFormated(double valor) {
//   final formatadorValor = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
//   return formatadorValor
//       .format(
//         valor,
//       )
//       .trim();
// }

// numberInStringWithDecimalCommaStringWithDecimalPoint(String? value) {
//   String newValue = value ?? '0';
//   var indexOfDecimalBegin = newValue.indexOf(',');
//   if (indexOfDecimalBegin != -1) {
//     var intValue = newValue
//         .substring(0, indexOfDecimalBegin)
//         .replaceAll('.', ',')
//         .trim()
//         .replaceAll(',', '');
//     newValue = '$intValue.${newValue.substring(indexOfDecimalBegin + 1)}';
//   }
//   return newValue;
// }
