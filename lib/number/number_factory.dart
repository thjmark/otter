import 'dart:math';

import 'package:otter/number/float_number/float_number.dart';
import 'package:otter/number/number_parser.dart';
import 'package:otter/number/whole_number/whole_number.dart';

import 'number.dart';

class NumberFactory {
  final numberParser = NumberParser();

  NumberFactory(this.flags);

  final List<String> flags;

  Number parseNumber({required String expression, required int base}) {
    return WholeNumber(NumberParser.parseInt(expression, base));
  }

  final exponentSeparator = '@';
  final decimalPoint = '.';
  final baseSeparator = '#';

  Number parseFloat(
      {required beforeDecimalPointPart,
      required afterDecimalPointPart,
      required base,
      exponentSign = "+",
      exponent = "0"}) {
    double number =
        _getValue(beforePointPart: beforeDecimalPointPart, afterPointPart: afterDecimalPointPart, base: base);
    double exponentialPart =
        _getExponentialPart(exponentSignText: exponentSign, exponentValueText: exponent, base: base);

    return FloatNumber(number * exponentialPart);
  }

  double _getExponentialPart({required String exponentValueText, required String exponentSignText, required int base}) {
    final exponentValue = NumberParser.parseInt(exponentValueText, base);
    final exponentSign = exponentSignText == "+" ? 1 : -1;
    return pow(base.toDouble(), exponentValue * exponentSign).toDouble();
  }

  double _getValue({required beforePointPart, required afterPointPart, required base}) {
    final numberBeforeDecimalSeparator = NumberParser.parseInt(beforePointPart, base);
    final numberAfterDecimalSeparator = NumberParser.parsePostDecimalPointPart(afterPointPart, base);
    return numberBeforeDecimalSeparator + numberAfterDecimalSeparator;
  }
}
