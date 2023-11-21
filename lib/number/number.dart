import 'package:otter/number/number_printer.dart';

class Number {
  final NumberPrinter numberPrinter = NumberPrinter();

  Number(this.value, {int? base}) : base = base ?? 10;

  final int value;
  final int base;

  @override
  String toString() {
    return numberPrinter.printIntForBase(value: value, base: base);
  }
}
