import 'package:otter/number/number_constants.dart';
import 'package:otter/parsing_error.dart';

class NumberParser {
  static final String baseSplitter = "#";

  static int parseNumber(String text) {
    final base = _getBase(text);
    final characterList = text.trim().split(baseSplitter)[0].runes;
    int result = 0;
    for (var element in characterList) {
      result *= base;
      if (element >= NumberConstants.NUMERIC_DIGIT_START && element < NumberConstants.NUMERIC_DIGIT_END) {
        var digit = (element - NumberConstants.NUMERIC_DIGIT_START);
        _checkDigit(digit: digit, base: base, digitName: element);
        result += digit;
      }
      if (element >= NumberConstants.LOWER_ALPHA_DIGIT_START && element < NumberConstants.LOWER_ALPHA_DIGIT_END) {
        var digit = (element - NumberConstants.LOWER_ALPHA_DIGIT_START) + NumberConstants.NUMBER_NUMERIC_DIGITS;
        _checkDigit(digit: digit, base: base, digitName: element);
        result += digit;
      }
      if (element >= NumberConstants.HIGHER_ALPHA_DIGIT_START && element < NumberConstants.HIGHER_ALPHA_DIGIT_END) {
        var digit = (element - NumberConstants.HIGHER_ALPHA_DIGIT_START) +
            NumberConstants.NUMBER_NUMERIC_DIGITS +
            NumberConstants.NUMBER_OF_LETTERS;
        _checkDigit(digit: digit, base: base, digitName: element);
        result += digit;
      }
    }
    return result;
  }

  static _checkDigit({required int digit, required int base, required int digitName}) {
    if (digit >= base) {
      throw ParsingError(
          "Digit ${String.fromCharCode(digitName)} not valid for Base $base . Digit order [0-9][A-Z][a-z]");
    }
  }

  static int _getBase(String text) {
    if (text.contains(baseSplitter)) {
      return int.parse(text.split(baseSplitter)[1]);
    }
    return 10;
  }
}
