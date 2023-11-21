import 'package:antlr4/antlr4.dart';
import 'package:otter/number/number.dart';
import 'package:otter/number/number_factory.dart';
import 'package:otter/number_visitor.dart';
import 'package:otter/parser/OtterLexer.dart';
import 'package:otter/parser/OtterParser.dart';

int calculate(String expression, {List<String>? flags}) {
  Number? result = _evaluateExpression(expression, flags ?? []);
  return result?.value ?? 0;
}

Number? _evaluateExpression(String expression, List<String> flags) {
  OtterParser parser = _buildTree(expression);
  final tree = parser.expression();
  final result = NumberVisitor(NumberFactory(flags)).visit(tree);
  return result;
}

OtterParser _buildTree(String expression) {
  final chars = InputStream.fromString(expression);
  final lexer = OtterLexer(chars);
  final tokens = CommonTokenStream(lexer);
  final parser = OtterParser(tokens);
  parser.buildParseTree = true;
  return parser;
}

String evaluate(String expression, {List<String>? flags}) {
  final parser = _buildTree(expression);
  final tree = parser.result();
  final result = NumberVisitor(NumberFactory(flags ?? [])).visit(tree);
  return result?.toString() ?? '';
}
