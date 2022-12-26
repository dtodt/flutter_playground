const _kCleanNumberPattern = r'(\D)';
const _kCpfFormatPattern = r'^(\w{3})(\w{3})(\w{3})(\w{2})$';

String formatCpf(String number) =>
    _cleanUpNumber(number).padRight(11, 'X').replaceAllMapped(
        RegExp(_kCpfFormatPattern), (m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}');

bool isCpfValid(String number) {
  final cleanedNumber = _cleanUpNumber(number);
  final numberDigits = _parseNumberDigits(cleanedNumber);
  if (_hasSameDigit(numberDigits) || numberDigits.length != 11) {
    return false;
  }

  final secondRef = numberDigits.removeLast();
  final int secondDigit = _calculateDigit(numberDigits);
  if (secondRef != secondDigit) {
    return false;
  }

  final firstRef = numberDigits.removeLast();
  final int firstDigit = _calculateDigit(numberDigits);
  return firstRef == firstDigit;
}

int _calculateDigit(List<int> digits) {
  final digitSum = _sumDigits(digits.reversed.toList());
  final rest = digitSum % 11;
  if (rest < 2) {
    return 0;
  } else {
    return 11 - rest;
  }
}

int _sumDigits(List<int> digits) {
  var multiplier = 2;
  var sum = 0;
  for (var d = 0; d < digits.length; d++, multiplier++) {
    sum += digits[d] * multiplier;
  }
  return sum;
}

String _cleanUpNumber(String number) {
  return number.trim().replaceAll(RegExp(_kCleanNumberPattern), '');
}

bool _hasSameDigit(List<int> digits) {
  if (digits.isEmpty) return false;
  return digits.every((digit) => digit == digits[0]);
}

List<int> _parseNumberDigits(String number) {
  return number.split('').map((e) => int.parse(e)).toList();
}
