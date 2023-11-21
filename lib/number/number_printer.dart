import 'package:otter/parsing_error.dart';
import 'package:otter/number/number_constants.dart';

class NumberPrinter {
  String printIntForBase({required int value, required int base}) {
    _checkBase(base);
    String result = _mapNumber(value: value, base: base);
    if (base == 10) {
      return result;
    }
    return "$result#$base";
  }

  String _mapNumber({required int value, required int base}) {
    String result = "";
    int restOfNumber = value.abs();
    while (restOfNumber > 0) {
      int currentDigit = restOfNumber % base;
      result += _mapCurrentDigit(currentDigit);
      restOfNumber -= currentDigit;
      restOfNumber = (restOfNumber / base).round();
    }
    String sign = value.sign < 0 ? '-' : '';
    result = "$sign${_turnDigitsAround(result)}";
    return result;
  }

  String _turnDigitsAround(String result) => result.split("").reversed.join("");

  String _mapCurrentDigit(int currentDigit) {
    if (_isNumericDigit(currentDigit)) {
      return "$currentDigit";
    }
    if (_isUpperCaseAlphaDigit(currentDigit)) {
      final digitLetterCode = _getCapitalDigitCode(currentDigit);
      return String.fromCharCode(digitLetterCode);
    }
    if (_isLowerCaseAlphaDigit(currentDigit)) {
      var digitLetterCode = _getLowerCaseAlphaDigitCode(currentDigit);
      return String.fromCharCode(digitLetterCode);
    }

    return "Error base to large";
  }

  int _getLowerCaseAlphaDigitCode(int currentDigit) {
    return currentDigit -
        NumberConstants.NUMBER_NUMERIC_DIGITS -
        NumberConstants.NUMBER_OF_LETTERS +
        NumberConstants.HIGHER_ALPHA_DIGIT_START;
  }

  int _getCapitalDigitCode(int currentDigit) =>
      currentDigit - NumberConstants.NUMBER_NUMERIC_DIGITS + NumberConstants.LOWER_ALPHA_DIGIT_START;

  bool _isLowerCaseAlphaDigit(int currentDigit) =>
      currentDigit < 2 * NumberConstants.NUMBER_OF_LETTERS + NumberConstants.NUMBER_NUMERIC_DIGITS;

  bool _isUpperCaseAlphaDigit(int currentDigit) =>
      currentDigit < NumberConstants.NUMBER_OF_LETTERS + NumberConstants.NUMBER_NUMERIC_DIGITS;

  bool _isNumericDigit(int currentDigit) => currentDigit < NumberConstants.NUMBER_NUMERIC_DIGITS;

  void _checkBase(int base) {
    if (base > NumberConstants.NUMBER_OF_LETTERS * 2 + NumberConstants.NUMBER_NUMERIC_DIGITS) {
      throw ParsingError("Base > 62 not supported");
    }
  }
}
