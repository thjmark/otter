import 'dart:math';

import 'package:otter/otter.dart';
import 'package:otter/parsing_error.dart';
import 'package:test/test.dart';

import 'test_util.dart';

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

  test('parseNumber floating Point number full exponent', () {
    testFloatEquals(calculate("-9.221@-32#10", flags: ["-f"]), -9.221e-32);
    testFloatEquals(calculate("-9.221@32#10", flags: ["-f"]), -9.221e32);
    testFloatEquals(calculate("1.0@1010#2"), 1024.0);
  });

  test('parseNumber floating Point number full exponent', () {
    testFloatEquals(calculate("3122.122#10", flags: ["-f"]), 3122.122);
    testFloatEquals(calculate("0.01#2", flags: ["-f"]), 0.25);
  });

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

  test("should evalutate double numbers with all baseses", () {
    expect(evaluate("sqrt(15.2#10+0.7#10)/19.0#10", flags: ["-f"]), "2.098673898671251@-1");
    expect(evaluate("1.0@25#10+1.0@24#10", flags: ["-f"]), "1.1@25");
    expect(evaluate("1.1@1010#2+1.0@1001#2=#2", flags: ["-f"]), "1.0@1011#2");
  });

  test("should evalutate double numbers with default base 10", () {
    expect(evaluate("sqrt(15.2+0.7)/19.0", flags: ["-f"]), "2.098673898671251@-1");
    expect(evaluate("sqrt(1.52@1+0.7)/1.90@1", flags: ["-f"]), "2.098673898671251@-1");
  });

  test("should evaluate ln", () {
    expect(evaluate("ln(2.0)", flags: ["-f"]), "6.931471805599453@-1");
  });

  test("should evaluate log to correct base", () {
    expect(evaluate("log(2.0)", flags: ["-f"]), "3.0102999566398114@-1");
  });

  test("should evaluate log to correct base, should allow to switch base", () {
    expect(evaluate("log(2.0>2)"), "1.0#2");
  });

  test("should evaluate factorial", () {
    expect(evaluate("6!"), "720");
    expect(evaluate("0!"), "1");
  });

  test("should print 0", () {
    expect(evaluate("0"), "0");
    expect(evaluate("0.0"), "0");
  });


  test("should evaluate sin",(){
    expect(evaluate("sin(0)"), "0");
    expect(evaluate("sin(0.5235987755983)"), "5.00000000000001@-1");
    expect(evaluate("sin(1.5707963267948966)"), "1.0");
  });

  test("should evaluate cos",(){
    expect(evaluate("cos(0.0)"), "1.0");
    expect(evaluate("cos(1.0471975511965976)"), "5.000000000000001@-1");
    expect(evaluate("cos(1.5707963267948966)"), "6.123233995736766@-17");
  });

  test("should evaluate tan",(){
    expect(evaluate("tan(0)"), "0");
    expect(evaluate("tan(0.78539816339744836)"), "1.0000000000000002");
  });

  test("should evaluate asin",(){
    expect(evaluate("asin(0.0)"), "0");
    expect(evaluate("asin(0.5)"), "5.235987755982989@-1");
  });

  test("should evaluate acos",(){
    expect(evaluate("acos(1.0)"), "0");
    expect(evaluate("acos(0.5)"), "1.0471975511965979");
  });

  test("should evaluate atan",(){
    expect(evaluate("atan(1.0)"), "7.853981633974483@-1");
    expect(evaluate("atan(0.0)"), "0");
  });

  // TODO(ThorstenJahrsetz): 20.12.22 add degrees with flags
  // TODO(ThorstenJahrsetz): 20.12.22 add special functions like sinh,...
}
