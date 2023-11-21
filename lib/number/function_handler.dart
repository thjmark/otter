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
    }
    throw ParsingError("The function $functionName is not implemented");
  }
}
