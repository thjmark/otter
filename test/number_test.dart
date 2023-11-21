import 'package:otter/number/number.dart';
import 'package:otter/parsing_error.dart';
import 'package:test/test.dart';

void main() {
  test("printForNumericalDigits", () {
    expect(Number(31, base: 10).toString(), "31");
    expect(Number(31, base: 7).toString(), "43#7");
  });

  test("printForCapitalDigits", () {
    expect(Number(31, base: 16).toString(), "1F#16");
    expect(Number(35, base: 36).toString(), "Z#36");
  });
  test("printForSmallDigits", () {
    expect(Number(36, base: 37).toString(), "a#37");
    expect(Number(61, base: 62).toString(), "z#62");
  });

  test("print negative Numbers",(){
   expect(Number(-1,base: 10).toString(), "-1");
   expect(Number(-1,base: 12).toString(), "-1#12");
  });

  test("Show error when base to large", () {
    expect(() => Number(15, base: 63).toString(), throwsA(ParsingError("Base > 62 not supported")));
  });


}