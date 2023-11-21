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

  /// Enter a parse tree produced by [OtterParser.number].
  /// [ctx] the parse tree
  void enterNumber(NumberContext ctx);
  /// Exit a parse tree produced by [OtterParser.number].
  /// [ctx] the parse tree
  void exitNumber(NumberContext ctx);
}