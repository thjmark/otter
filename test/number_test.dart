import 'package:otter/number/number.dart';
import 'package:otter/parsing_error.dart';
import 'package:test/test.dart';

void main() {
  test("printForNumericalDigits", () {
    expect(Number(31, base: 10).printForBase(), "31");
    expect(Number(31, base: 7).printForBase(), "43#7");
  });

  test("printForCapitalDigits", () {
    expect(Number(31, base: 16).printForBase(), "1F#16");
    expect(Number(35, base: 36).printForBase(), "Z#36");
  });
  test("printForSmallDigits", () {
    expect(Number(36, base: 37).printForBase(), "a#37");
    expect(Number(61, base: 62).printForBase(), "z#62");
  });

  test("Show error when base to large", () {
    expect(() => Number(15, base: 63).printForBase(), throwsA(ParsingError("Base > 62 not supported")));
  });

}