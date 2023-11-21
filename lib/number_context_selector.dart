import 'parser/OtterParser.dart';

class NumberContextSelector {
  static int getBase(NumberContext ctx) => int.parse(ctx.children![ctx.childCount - 1].text!);

  static String? getAfterDecimalPointElement(NumberContext ctx) => ctx.children![2].text;

  static String? getBeforeDecimalElement(NumberContext ctx) => ctx.children![0].text;

  static String getExponentValue(bool exponentHasSign, NumberContext ctx) =>
      ctx.children![4 + (exponentHasSign ? 1 : 0)].text!;

  static String getSignOfExponent(bool exponentHasSign, NumberContext ctx) =>
      exponentHasSign && ctx.children![4].text == "-" ? "-" : "+";
}
