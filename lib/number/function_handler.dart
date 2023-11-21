import 'dart:math';

import 'package:otter/parsing_error.dart';

class FunctionHandler {
  double handleFunction({required String functionName, required num value, required int base, List<String>? flags}) {
    switch (functionName) {
      case "sqrt":
        return sqrt(value);
      case "ln":
        return log(value);
      case "log":
        return log(value) / log(base);
      case "sin":
        return sin(value);
      case "cos":
        return cos(value);
      case "tan":
        return tan(value);
      case "asin":
        return asin(value);
      case "acos":
        return acos(value);
      case "atan":
        return atan(value);
    }
    throw ParsingError("The function $functionName is not implemented");
  }
}
