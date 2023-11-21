import 'dart:math';

import 'package:otter/number/number.dart';
import 'package:otter/parsing_error.dart';

class FloatNumber extends Number {
  FloatNumber(double value, {int? base}) : super(value, base: base);

  @override
  Number add(Number secondSummand) {
    return FloatNumber(value + secondSummand.value.toDouble(), base: base);
  }

  @override
  Number divide(Number divisor) {
    return FloatNumber(value / divisor.value.toDouble(), base: base);
  }

  @override
  Number flipSign() {
    return FloatNumber(-1 * value.toDouble(), base: base);
  }

  @override
  Number modulo(Number divisor) {
    throw ParsingError("Modulo not defined for floating point numbers");
  }

  @override
  Number multiply(Number secondFactor) {
    return FloatNumber(value * secondFactor.value.toDouble(), base: base);
  }

  @override
  Number nPow(Number exponent) {
    return FloatNumber(pow(value, exponent.value).toDouble(), base: base);
  }

  @override
  Number nSqrt() {
    return FloatNumber(sqrt(value), base: base);
  }

  @override
  Number setBase(int newBase) {
    return FloatNumber(value.toDouble(), base: newBase);
  }

  @override
  Number subtract(Number subtrahend) {
    return FloatNumber(value - subtrahend.value.toDouble(), base: base);
  }
}
