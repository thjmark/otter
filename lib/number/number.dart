import 'dart:math';

import 'package:otter/number/number_printer.dart';

class Number  {
  final NumberPrinter numberPrinter = NumberPrinter();

  Number(this.value, {int? base}) : base = base ?? 10;

  final int value;
  final int base;

  @override
  String toString() {
    return numberPrinter.printIntForBase(value: value, base: base);
  }

  Number flipSign() {
    return Number(-value);
  }

  Number add(Number secondSummand) {
    return Number(value + secondSummand.value);
  }

  Number subtract(Number subtrahend) {
    return Number(value - subtrahend.value);
  }

  Number multiply(Number secondFactor) {
    return Number(value * secondFactor.value);
  }

  Number divide(Number divisor) {
    return Number((value / divisor.value).round());
  }

  Number nPow(Number exponent) {
    return Number(pow(value, exponent.value).round());
  }

  Number modulo(Number divisor) {
    return Number(value % divisor.value);
  }

  Number setBase(int newBase){
    return Number(value,base: newBase);
  }

  Number nSqrt(){
    return Number(sqrt(value).round());
  }
}
