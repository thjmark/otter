// Generated from Otter.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'OtterParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [OtterParser].
abstract class OtterListener extends ParseTreeListener {
  /// Enter a parse tree produced by [OtterParser.result].
  /// [ctx] the parse tree
  void enterResult(ResultContext ctx);
  /// Exit a parse tree produced by [OtterParser.result].
  /// [ctx] the parse tree
  void exitResult(ResultContext ctx);

  /// Enter a parse tree produced by [OtterParser.expression].
  /// [ctx] the parse tree
  void enterExpression(ExpressionContext ctx);
  /// Exit a parse tree produced by [OtterParser.expression].
  /// [ctx] the parse tree
  void exitExpression(ExpressionContext ctx);

  /// Enter a parse tree produced by the [sign]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterSign(SignContext ctx);
  /// Exit a parse tree produced by the [sign]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitSign(SignContext ctx);

  /// Enter a parse tree produced by the [float]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterFloat(FloatContext ctx);
  /// Exit a parse tree produced by the [float]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitFloat(FloatContext ctx);

  /// Enter a parse tree produced by the [floatBase10]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterFloatBase10(FloatBase10Context ctx);
  /// Exit a parse tree produced by the [floatBase10]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitFloatBase10(FloatBase10Context ctx);

  /// Enter a parse tree produced by the [decimal]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterDecimal(DecimalContext ctx);
  /// Exit a parse tree produced by the [decimal]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitDecimal(DecimalContext ctx);

  /// Enter a parse tree produced by the [decimalBase10]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterDecimalBase10(DecimalBase10Context ctx);
  /// Exit a parse tree produced by the [decimalBase10]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitDecimalBase10(DecimalBase10Context ctx);

  /// Enter a parse tree produced by the [int]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterInt(IntContext ctx);
  /// Exit a parse tree produced by the [int]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitInt(IntContext ctx);

  /// Enter a parse tree produced by the [intBase10]
  /// labeled alternative in [file.parserName>.number].
  /// [ctx] the parse tree
  void enterIntBase10(IntBase10Context ctx);
  /// Exit a parse tree produced by the [intBase10]
  /// labeled alternative in [OtterParser.number].
  /// [ctx] the parse tree
  void exitIntBase10(IntBase10Context ctx);
}