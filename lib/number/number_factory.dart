
import 'package:otter/number/number_parser.dart';

import 'number.dart';

class NumberFactory{
  final numberParser=NumberParser();
  NumberFactory(this.flags);
  final List<String> flags;

  Number parseNumber(String expression){
    return Number(NumberParser.parseInt(expression));
  }
}