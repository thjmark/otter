import 'package:otter/otter.dart';
import 'package:otter/parsing_error.dart';
import 'package:test/test.dart';

void main() {
  test('parseNumber base 10', () {
    expect(calculate("15"), 15);
  });

  test('parseNumber base 5', () {
    expect(calculate("14#5"), 9);
  });

  test('parseNumber base 16', () {
    expect(calculate("1A#16"), 26);
  });

  test('parseNumber base 37', () {
    expect(calculate("1a#37"), 73);
  });

  test('parseNumber with numerical digit (to big for base)', () {
    expect(() => calculate("8#7"), throwsA(ParsingError("Digit 8 not valid for Base 7 . Digit order [0-9][A-Z][a-z]")));
    expect(calculate("8#9"), 8);
  });

  test('parseNumber with capital digit (to big for base)', () {
    expect(
        () => calculate("A#10"), throwsA(ParsingError("Digit A not valid for Base 10 . Digit order [0-9][A-Z][a-z]")));
    expect(calculate("A#11"), 10);
  });

  test('parseNumber with small digit (to big for base)', () {
    expect(
        () => calculate("a#36"), throwsA(ParsingError("Digit a not valid for Base 36 . Digit order [0-9][A-Z][a-z]")));
    expect(calculate("a#37"), 36);
  });

  // TODO(ThorstenJahrsetz): 18.12.22 next step parse Float
  /*test('parseNumber floating Point number', () {
    final result = calculate("-9.221@-32#10", flags: ["-f"]);
    expect(result, -9.221e-32);
  });*/

  test("get defaultResult (base 10)", () {
    expect(evaluate("1A#16"), "26");
  });

  test("get result for different base 16", () {
    expect(evaluate("26=#16"), "1A#16");
  });

  test("should get negative of number", () {
    expect(evaluate("-10"), "-10");
  });

  test("should add two numbers", () {
    expect(evaluate("17+4"), "21");
    expect(evaluate("11#16+A#16=#16"), "1B#16");
  });
  test("should subtract two numbers", () {
    expect(evaluate("17-4"), "13");
    expect(evaluate("11#16-A#16=#16"), "7#16");
  });

  test("should multiply two numbers", () {
    expect(evaluate("4*5"), "20");
    expect(evaluate("40#16*2"), "128");
  });

  test("should multiply two numbers", () {
    expect(evaluate("4*5"), "20");
    expect(evaluate("40#16*2"), "128");
  });

  test("should divide two numbers", () {
    expect(evaluate("12/3"), "4");
    expect(evaluate("11#7/2"), "4");
  });

  test("should divide two numbers and round correct", () {
    expect(evaluate("5/3"), "2");
    expect(evaluate("7/2"), "4");
    expect(evaluate("4/3"), "1");
  });

  test("should divide two numbers multiplication before addition", () {
    expect(evaluate("(1+2)/3"), "1");
    expect(evaluate("1+2/3"), "2");
  });

  test("should calculate modulus of two numbers", () {
    expect(evaluate("5%3"), "2");
    expect(evaluate("7%2"), "1");
  });

  test("should calculate power of two numbers", () {
    expect(evaluate("3^4"), "81");
    expect(evaluate("2^5"), "32");
  });

  test("should calculate sqrt of number", () {
    expect(evaluate("sqrt(16)"), "4");
  });
}
