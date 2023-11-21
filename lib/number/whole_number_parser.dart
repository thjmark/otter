import 'dart:math';

import 'package:otter/number/number_constants.dart';
import 'package:otter/parsing_error.dart';

class NumberParser {
  static final String baseSplitter = "#";

  static int parseInt(String text, int base) {
    final characterList = text.trim().split(baseSplitter)[0].runes;
    int result = 0;
    for (var element in characterList) {
      result *= base;
      result += _parseDigit(element, base);
    }
    return result;
  }

  static int _parseDigit(int digitCode, int base) {
    if (digitCode >= NumberConstants.NUMERIC_DIGIT_START && digitCode < NumberConstants.NUMERIC_DIGIT_END) {
      final digit = (digitCode - NumberConstants.NUMERIC_DIGIT_START);
      _checkDigit(digit: digit, base: base, digitName: digitCode);
      return digit;
    }
    if (digitCode >= NumberConstants.LOWER_ALPHA_DIGIT_START && digitCode < NumberConstants.LOWER_ALPHA_DIGIT_END) {
      var digit = (digitCode - NumberConstants.LOWER_ALPHA_DIGIT_START) + NumberConstants.NUMBER_NUMERIC_DIGITS;
      _checkDigit(digit: digit, base: base, digitName: digitCode);
      return digit;
    }
    if (digitCode >= NumberConstants.HIGHER_ALPHA_DIGIT_START && digitCode < NumberConstants.HIGHER_ALPHA_DIGIT_END) {
      var digit = (digitCode - NumberConstants.HIGHER_ALPHA_DIGIT_START) +
          NumberConstants.NUMBER_NUMERIC_DIGITS +
          NumberConstants.NUMBER_OF_LETTERS;
      _checkDigit(digit: digit, base: base, digitName: digitCode);
      return digit;
    }
    throw ParsingError(
        "Digit ${String.fromCharCode(digitCode)} not valid for Base $base . Digit order [0-9][A-Z][a-z]");
  }

  static _checkDigit({required int digit, required int base, required int digitName}) {
    if (digit >= base) {
      throw ParsingError(
          "Digit ${String.fromCharCode(digitName)} not valid for Base $base . Digit order [0-9][A-Z][a-z]");
    }
  }

  static int getBase(String text) {
    if (text.contains(baseSplitter)) {
      return int.parse(text.split(baseSplitter)[1]);
    }
    return 10;
  }

  static double parsePostDecimalPointPart(String input, int base) {
    var result = 0.0;
    final characterList = input.trim().runes.toList();
    characterList.asMap().forEach((index, value) {
      final digit = _parseDigit(value, base);
      result += pow(base, -(index + 1)) * digit;
    });
    return result;
  }
}
