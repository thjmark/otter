import 'dart:math';

import 'package:otter/parsing_error.dart';

class FunctionHandler {
  double handleFunction(
      {required String functionName, required num value, required int base, required List<String> flags}) {
    final trigonomicModeFactor = _getTrigonomicModeFactor(flags);
    switch (functionName) {
      case "sqrt":
        return sqrt(value);
      case "ln":
        return log(value);
      case "log":
        return log(value) / log(base);
      case "sin":
        return sin(value * trigonomicModeFactor);
      case "cos":
        return cos(value * trigonomicModeFactor);
      case "tan":
        return tan(value * trigonomicModeFactor);
      case "asin":
        return asin(value) / trigonomicModeFactor;
      case "acos":
        return acos(value) / trigonomicModeFactor;
      case "atan":
        return atan(value) / trigonomicModeFactor;
    }
    throw ParsingError("The function $functionName is not implemented");
  }

  double _getTrigonomicModeFactor(List<String> flags) {
    if (flags.contains("-deg")) {
      return (2 * pi) / 360;
    }
    return 1;
  }
}
