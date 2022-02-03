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

convertCommaToPointValue({required String value}) {
  if (value.runtimeType == String) {
    value = value.replaceAll('.', '');
    value = value.replaceAll(',', '.');
    return double.tryParse(value.trim()) ?? 0;
  }
  return value;
}
