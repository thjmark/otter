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

  /// Visit a parse tree produced by [OtterParser.number].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitNumber(NumberContext ctx);
}