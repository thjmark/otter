// Generated from Otter.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'OtterParser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [OtterParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class OtterVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [OtterParser.result].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitResult(ResultContext ctx);

  /// Visit a parse tree produced by [OtterParser.expression].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitExpression(ExpressionContext ctx);

  /// Visit a parse tree produced by the {@code sign}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSign(SignContext ctx);

  /// Visit a parse tree produced by the {@code float}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFloat(FloatContext ctx);

  /// Visit a parse tree produced by the {@code floatBase10}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFloatBase10(FloatBase10Context ctx);

  /// Visit a parse tree produced by the {@code decimal}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDecimal(DecimalContext ctx);

  /// Visit a parse tree produced by the {@code decimalBase10}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDecimalBase10(DecimalBase10Context ctx);

  /// Visit a parse tree produced by the {@code int}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitInt(IntContext ctx);

  /// Visit a parse tree produced by the {@code intBase10}
  /// labeled alternative in {@link OtterParser#number}.
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitIntBase10(IntBase10Context ctx);
}