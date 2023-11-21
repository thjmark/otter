

abstract class Number  {

  Number(this.value, {int? base}) : base = base ?? 10;

  final num value;
  final int base;

  @override
  String toString();

  Number flipSign();

  Number add(Number secondSummand);

  Number subtract(Number subtrahend);

  Number multiply(Number secondFactor);

  Number divide(Number divisor);

  Number nPow(Number exponent);

  Number modulo(Number divisor);

  Number setBase(int newBase);

  Number applyFunction(String functionName);

  Number factorial();
}
