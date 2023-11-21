import 'package:otter/number/whole_number/whole_number_parser.dart';
import 'package:otter/number/whole_number/whole_number.dart';

import 'number.dart';

class NumberFactory {
  final numberParser = WholeNumberParser();

  NumberFactory(this.flags);

  final List<String> flags;

  Number parseNumber(String expression) {
    return WholeNumber(WholeNumberParser.parseInt(expression));
  }
}
