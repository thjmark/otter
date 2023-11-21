import 'dart:math';

import 'package:otter/number/function_handler.dart';
import 'package:otter/number/number.dart';
import 'package:otter/number/whole_number/whole_number_printer.dart';

class WholeNumber extends Number {
  final WholeNumberPrinter numberPrinter = WholeNumberPrinter();

  WholeNumber(num value, {int? base}) : super(value, base: base);

  @override
  String toString() {
    return numberPrinter.printIntForBase(value: value.round(), base: base);
  }

  @override
  Number flipSign() {
    return WholeNumber(-value);
  }

  @override
  Number add(Number secondSummand) {
    return WholeNumber(value + secondSummand.value);
  }

  @override
  Number subtract(Number subtrahend) {
    return WholeNumber(value - subtrahend.value);
  }

  @override
  Number multiply(Number secondFactor) {
    return WholeNumber(value * secondFactor.value);
  }

  @override
  Number divide(Number divisor) {
    return WholeNumber((value / divisor.value).round());
  }

  @override
  Number nPow(Number exponent) {
    return WholeNumber(pow(value, exponent.value).round());
  }

  @override
  Number modulo(Number divisor) {
    return WholeNumber(value % divisor.value);
  }

  @override
  Number setBase(int newBase) {
    return WholeNumber(value, base: newBase);
  }

  @override
  Number applyFunction(String functionName, {required List<String> flags}) {
    return WholeNumber(
        FunctionHandler().handleFunction(functionName: functionName, value: value, base: base, flags: flags).round(),
        base: base);
  }

  @override
  Number factorial() {
    var result = 1;
    for (int i = 1; i <= value; i++) {
      result *= i;
    }
    return WholeNumber(result, base: base);
  }
}
