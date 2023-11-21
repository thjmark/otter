import 'dart:math';

import 'package:otter/number/number_parser.dart';
import 'package:otter/parser/OtterParser.dart';
import 'package:otter/parser/OtterVisitor.dart';
import 'package:otter/parsing_error.dart';

import 'number/number.dart';

class NumberVisitor extends OtterVisitor<Number> {
  @override
  Number? visitExpression(ExpressionContext ctx) {
    if (ctx.childCount == 1) {
      return _getNumber(ctx);
    }
    if (ctx.childCount == 2) {
      return _handleSign(ctx);
    }
    if (ctx.childCount == 3) {
      if (isInBrakets(ctx)) {
        return ctx.children![1].accept(this);
      }
      if (_isFunctionCall(ctx)) {
        return _handleFunctionCall(ctx);
      }
      return _handleCalculationStep(ctx);
    }
  }

  bool isInBrakets(ExpressionContext ctx) => ctx.children![0].text == '(' && ctx.children![2].text == ')';

  bool _isFunctionCall(ExpressionContext ctx) {
    return ctx.children![2].text == ')';
  }

  Number? _getNumber(ExpressionContext ctx) => ctx.children![0].accept(this);

  Number _handleCalculationStep(ExpressionContext ctx) {
    final firstNumber = _getNumber(ctx);
    final secondNumber = ctx.children![2].accept(this);
    switch (ctx.children![1].text) {
      case "+":
        return Number(firstNumber!.value + secondNumber!.value);
      case "-":
        return Number(firstNumber!.value - secondNumber!.value);
      case "*":
        return Number(firstNumber!.value * secondNumber!.value);
      case "/":
        return Number((firstNumber!.value / secondNumber!.value).round());
      case "%":
        return Number(firstNumber!.value % secondNumber!.value);
      case "^":
        return Number(pow(firstNumber!.value, secondNumber!.value).round());
    }
    throw ParsingError("Unknown operator ${ctx.children![1].text}");
  }

  @override
  Number? visitResult(ResultContext ctx) {
    return _setCorrectOutputBase(ctx);
  }

  Number? _setCorrectOutputBase(ResultContext ctx) {
    if (ctx.childCount == 1) {
      return ctx.children?[0].accept(this);
    }
    if (ctx.childCount == 3) {
      final result = ctx.children![0].accept(this);
      final base = int.parse(ctx.children![2].text!);
      return Number(result!.value, base: base);
    }
    throw UnimplementedError();
  }

  @override
  Number? visitNumber(NumberContext ctx) {
    return Number(NumberParser.parseNumber(ctx.text));
  }

  Number? _handleFunctionCall(ExpressionContext ctx) {
    final argument = ctx.children![1].accept(this);
    final functionName = ctx.children![0].text!.split('(')[0];
    switch (functionName) {
      case 'sqrt':
        return Number(sqrt(argument!.value).round());
    }
  }

  Number _handleSign(ExpressionContext ctx) {
    final absoluteValue = ctx.children![1].accept(this);
    final sign = ctx.children![0].text == '-' ? -1 : 1;
    return Number(absoluteValue!.value * sign);
  }
}