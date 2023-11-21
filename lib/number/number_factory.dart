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

  Number parseFloat(List<ParseTree> children, int childNumber) {
    final indexDecimalPoint = children.indexWhere((element) => element.text == decimalPoint);
    final indexExponentSeparator = children.indexWhere((element) => element.text == exponentSeparator);
    final base = int.parse(children[childNumber - 1].text!);
    final numberBeforeDecimalSeparator = NumberParser.parseInt(children[indexDecimalPoint - 1].text!, base);
    final numberAfterDecimalSeparator =
        NumberParser.parsePostDecimalPointPart(children[indexDecimalPoint + 1].text!, base);

    final exponentElements = children.sublist(indexExponentSeparator+1, childNumber - 2);
    final exponentValue = NumberParser.parseInt(exponentElements.last.text!, base);
    final exponentSign = exponentElements.length == 2 ? (exponentElements[0].text == '-' ? -1 : 1) : 1;
    final exponent = pow(base.toDouble(), exponentValue * exponentSign);

    return FloatNumber((numberBeforeDecimalSeparator + numberAfterDecimalSeparator) * exponent);
  }
}
