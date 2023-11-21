import 'dart:math';

import '../whole_number/whole_number_printer.dart';

const VALID_DECIMAL_PLACES_DOUBLE = 17;

class FloatNumberPrinter {
  static String print(double value, int base) {
    if (base == 10) {
      return value.toStringAsExponential().replaceAll("e", "@").replaceAll("+", "");
    }

    final fullExponent = log(value.abs()) / log(base);
    final wholeExponent = fullExponent.truncate();
    final numericalPart = value / pow(base, wholeExponent);

    final String stringNumericalParts = _buildNumericalPart(numericalPart, base);

    final exponent= WholeNumberPrinter().printIntForBase(value: wholeExponent, base: base);
    return "$stringNumericalParts@$exponent";
  }

  static String _buildNumericalPart(double numericalPart, int base) {
    final int validDigits = (VALID_DECIMAL_PLACES_DOUBLE * log(10) / log(base)).floor();
    var result = "";
    var currentNumericalValue = numericalPart.abs();
    for (var i = 0; i < validDigits; i++) {
      result += currentNumericalValue.truncate().toString();
      currentNumericalValue -= currentNumericalValue.truncate();
      currentNumericalValue *= base;
      if (i == 0) {
        result += ".";
      }
      if (currentNumericalValue < pow(base, -3)) {
        break;
      }
    }
    if (result.endsWith('.')) {
      result += "0";
    }
    final sign = numericalPart < 0 ? "-" : "";
    return "$sign$result";
  }
}
