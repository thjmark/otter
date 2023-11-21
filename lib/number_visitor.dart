import 'package:otter/number/number_factory.dart';
import 'package:otter/number/number_parser.dart';
import 'package:otter/parser/OtterParser.dart';
import 'package:otter/parser/OtterVisitor.dart';
import 'package:otter/parsing_error.dart';

import 'number/number.dart';

class NumberVisitor extends OtterVisitor<Number> {
  NumberVisitor(this.numberFactory, this.flags);

  final NumberFactory numberFactory;
  final List<String> flags;

  @override
  Number? visitExpression(ExpressionContext ctx) {
    if (ctx.childCount == 1) {
      return _getNumber(ctx);
    }
    if (ctx.childCount == 2 && ctx.children![1].text == "!") {
      return ctx.children![0].accept(this)?.factorial();
    }
    if (ctx.childCount == 3) {
      if (_isInBrakets(ctx)) {
        return ctx.children![1].accept(this);
      }
      if (_isBaseChange(ctx)) {
        final value = ctx.children![0].accept(this);
        final newBase = NumberParser.parseInt(ctx.children![2].text!, 10);
        return value!.setBase(newBase);
      }
      if (_isFunctionCall(ctx)) {
        return _handleFunctionCall(ctx);
      }
      return _handleCalculationStep(ctx);
    }
  }

  bool _isInBrakets(ExpressionContext ctx) => ctx.children![0].text == '(' && ctx.children![2].text == ')';

  bool _isFunctionCall(ExpressionContext ctx) {
    return ctx.children![2].text == ')';
  }

  Number? _getNumber(ExpressionContext ctx) => ctx.children![0].accept(this);

  Number _handleCalculationStep(ExpressionContext ctx) {
    final firstNumber = _getNumber(ctx);
    final secondNumber = ctx.children![2].accept(this);
    switch (ctx.children![1].text) {
      case "+":
        return firstNumber!.add(secondNumber!);
      case "-":
        return firstNumber!.subtract(secondNumber!);
      case "*":
        return firstNumber!.multiply(secondNumber!);
      case "/":
        return firstNumber!.divide(secondNumber!);
      case "%":
        return firstNumber!.modulo(secondNumber!);
      case "^":
        return firstNumber!.nPow(secondNumber!);
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
      return result!.setBase(base);
    }
    throw UnimplementedError();
  }

  Number? _handleFunctionCall(ExpressionContext ctx) {
    final argument = ctx.children![1].accept(this);
    final functionName = ctx.children![0].text!.split('(')[0];
    return argument!.applyFunction(functionName, flags: flags);
  }

  bool _isBaseChange(ExpressionContext ctx) {
    return ctx.childCount >= 2 && ctx.children![1].text == '>';
  }

  @override
  Number? visitDecimal(DecimalContext ctx) {
    return numberFactory.parseFloat(ctx.children!, ctx.childCount);// TODO(ThorstenJahrsetz): 09.01.23 clean this up
  }

  @override
  Number? visitDecimalBase10(DecimalBase10Context ctx) {
    return numberFactory.parseFloat(ctx.children!, ctx.childCount);// TODO(ThorstenJahrsetz): 09.01.23 clean this up
  }

  @override
  Number? visitFloat(FloatContext ctx) {
    return numberFactory.parseFloat(ctx.children!, ctx.childCount);// TODO(ThorstenJahrsetz): 09.01.23 clean this up
  }

  @override
  Number? visitFloatBase10(FloatBase10Context ctx) {
    return numberFactory.parseFloat(ctx.children!, ctx.childCount);// TODO(ThorstenJahrsetz): 09.01.23 clean this up
  }

  @override
  Number? visitInt(IntContext ctx) {
    return numberFactory.parseNumber(ctx.text); // TODO(ThorstenJahrsetz): 09.01.23 clean this up
  }

  @override
  Number? visitIntBase10(IntBase10Context ctx) {
    return numberFactory.parseNumber(ctx.text);// TODO(ThorstenJahrsetz): 09.01.23 clean this up
  }

  @override
  Number? visitSign(SignContext ctx) {
    return _handleSign(ctx);
  }



  Number _handleSign(NumberContext ctx) {
    final absoluteValue = ctx.children![1].accept(this);
    if (ctx.children![0].text == '-') {
      return absoluteValue!.flipSign();
    }
    return absoluteValue!;
  }

}
