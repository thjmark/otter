import 'package:otter/number/whole_number/whole_number.dart';
import 'package:otter/parsing_error.dart';
import 'package:test/test.dart';

void main() {
  test("printForNumericalDigits", () {
    expect(WholeNumber(31, base: 10).toString(), "31");
    expect(WholeNumber(31, base: 7).toString(), "43#7");
  });

  test("printForCapitalDigits", () {
    expect(WholeNumber(31, base: 16).toString(), "1F#16");
    expect(WholeNumber(35, base: 36).toString(), "Z#36");
  });
  test("printForSmallDigits", () {
    expect(WholeNumber(36, base: 37).toString(), "a#37");
    expect(WholeNumber(61, base: 62).toString(), "z#62");
  });

  test("print negative Numbers",(){
   expect(WholeNumber(-1,base: 10).toString(), "-1");
   expect(WholeNumber(-1,base: 12).toString(), "-1#12");
  });

  test("Show error when base to large", () {
    expect(() => WholeNumber(15, base: 63).toString(), throwsA(ParsingError("Base > 62 not supported")));
  });


}