import 'package:otter/number/number_constants.dart';
import 'package:otter/parsing_error.dart';

class Number {
  Number(this.value, {int? base}) : base = base ?? 10;

  final int value;
  final int base;

  String printForBase() {
    _checkBase();
    String result = "";
    int restOfNumber = value;
    while (restOfNumber > 0) {
      int currentDigit = restOfNumber % base;
      result += _mapCurrentDigit(currentDigit);
      restOfNumber -= currentDigit;
      restOfNumber = (restOfNumber / base).round();
    }
    result = _turnDigitsAround(result);
    if (base == 10) {
      return result;
    }
    return "$result#$base";
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

  void _checkBase() {
    if (base > NumberConstants.NUMBER_OF_LETTERS * 2 + NumberConstants.NUMBER_NUMERIC_DIGITS) {
      throw ParsingError("Base > 62 not supported");
    }
  }
}
