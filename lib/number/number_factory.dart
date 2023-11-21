import 'dart:math';

import 'package:antlr4/src/tree/src/tree.dart';
import 'package:otter/number/float_number/float_number.dart';
import 'package:otter/number/whole_number_parser.dart';
import 'package:otter/number/whole_number/whole_number.dart';

import 'number.dart';

class NumberFactory {
  final numberParser = NumberParser();

  NumberFactory(this.flags);

  final List<String> flags;

  Number parseNumber(String expression) {
    final base = NumberParser.getBase(expression);
    return WholeNumber(NumberParser.parseInt(expression, base));
  }

  final exponentSeparator = '@';
  final decimalPoint = '.';
  final baseSeparator = '#';

  Number parseFloat(List<ParseTree> children, int childNumber) {
    int base = _getBase(children, childNumber);
    double number = _getValue(children, base);
    double exponentialPart = _getExponentialPart(children, childNumber, base);

    return FloatNumber(number * exponentialPart);
  }

  int _getBase(List<ParseTree> children, int childNumber) {
    var base = 10;
    if (children[childNumber - 2].text == baseSeparator) {
      base = int.parse(children[childNumber - 1].text!);
    }
    return base;
  }

  double _getExponentialPart(List<ParseTree> children, int childNumber, int base) {
    final indexExponentSeparator = children.indexWhere((element) => element.text == exponentSeparator);
    if (indexExponentSeparator < 0) {
      return 1;
    }
    final endOfList = children.map((e) => e.text).contains("#") ? childNumber - 2 : childNumber;
    final exponentElements = children.sublist(indexExponentSeparator + 1, endOfList);
    final exponentValue = NumberParser.parseInt(exponentElements.last.text!, base);
    final exponentSign = exponentElements.length == 2 ? (exponentElements[0].text == '-' ? -1 : 1) : 1;
    return pow(base.toDouble(), exponentValue * exponentSign).toDouble();
  }

  double _getValue(List<ParseTree> children, int base) {
    final indexDecimalPoint = children.indexWhere((element) => element.text == decimalPoint);
    final numberBeforeDecimalSeparator = NumberParser.parseInt(children[indexDecimalPoint - 1].text!, base);
    final numberAfterDecimalSeparator =
        NumberParser.parsePostDecimalPointPart(children[indexDecimalPoint + 1].text!, base);
    return numberBeforeDecimalSeparator + numberAfterDecimalSeparator;
  }
}
