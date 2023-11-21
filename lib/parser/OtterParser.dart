// Generated from Otter.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'OtterListener.dart';
import 'OtterBaseListener.dart';
import 'OtterVisitor.dart';
import 'OtterBaseVisitor.dart';
const int RULE_result = 0, RULE_expression = 1, RULE_number = 2;
class OtterParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.11.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_T__4 = 5, TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_T__7 = 8, 
                   TOKEN_T__8 = 9, TOKEN_T__9 = 10, TOKEN_FN = 11, TOKEN_NUM = 12, 
                   TOKEN_WHITESPACE = 13;

  @override
  final List<String> ruleNames = [
    'result', 'expression', 'number'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'=#'", "')'", "'('", "'^'", "'*'", "'/'", "'%'", "'+'", "'-'", 
      "'#'", null, null, "' '"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, null, null, null, 
      "FN", "NUM", "WHITESPACE"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'Otter.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  OtterParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ResultContext result() {
    dynamic _localctx = ResultContext(context, state);
    enterRule(_localctx, 0, RULE_result);
    try {
      state = 11;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 0, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 6;
        expression(0);
        state = 7;
        match(TOKEN_T__0);
        state = 8;
        match(TOKEN_NUM);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 10;
        expression(0);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ExpressionContext expression([int _p = 0]) {
    final _parentctx = context;
    final _parentState = state;
    dynamic _localctx = ExpressionContext(context, _parentState);
    var _prevctx = _localctx;
    var _startState = 2;
    enterRecursionRule(_localctx, 2, RULE_expression, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 23;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_FN:
        state = 14;
        match(TOKEN_FN);
        state = 15;
        expression(0);
        state = 16;
        match(TOKEN_T__1);
        break;
      case TOKEN_T__2:
        state = 18;
        match(TOKEN_T__2);
        state = 19;
        expression(0);
        state = 20;
        match(TOKEN_T__1);
        break;
      case TOKEN_T__7:
      case TOKEN_T__8:
      case TOKEN_NUM:
        state = 22;
        number();
        break;
      default:
        throw NoViableAltException(this);
      }
      context!.stop = tokenStream.LT(-1);
      state = 36;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 3, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = _localctx;
          state = 34;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 2, context)) {
          case 1:
            _localctx = ExpressionContext(_parentctx, _parentState);
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 25;
            if (!(precpred(context, 4))) {
              throw FailedPredicateException(this, "precpred(context, 4)");
            }
            state = 26;
            match(TOKEN_T__3);
            state = 27;
            expression(5);
            break;
          case 2:
            _localctx = ExpressionContext(_parentctx, _parentState);
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 28;
            if (!(precpred(context, 3))) {
              throw FailedPredicateException(this, "precpred(context, 3)");
            }
            state = 29;
            _la = tokenStream.LA(1)!;
            if (!(((_la) & ~0x3f) == 0 && ((1 << _la) & 224) != 0)) {
            errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            state = 30;
            expression(4);
            break;
          case 3:
            _localctx = ExpressionContext(_parentctx, _parentState);
            pushNewRecursionContext(_localctx, _startState, RULE_expression);
            state = 31;
            if (!(precpred(context, 2))) {
              throw FailedPredicateException(this, "precpred(context, 2)");
            }
            state = 32;
            _la = tokenStream.LA(1)!;
            if (!(_la == TOKEN_T__7 || _la == TOKEN_T__8)) {
            errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            state = 33;
            expression(3);
            break;
          } 
        }
        state = 38;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 3, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return _localctx;
  }

  NumberContext number() {
    dynamic _localctx = NumberContext(context, state);
    enterRule(_localctx, 4, RULE_number);
    int _la;
    try {
      state = 45;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 4, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 39;
        _la = tokenStream.LA(1)!;
        if (!(_la == TOKEN_T__7 || _la == TOKEN_T__8)) {
        errorHandler.recoverInline(this);
        } else {
          if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
          errorHandler.reportMatch(this);
          consume();
        }
        state = 40;
        number();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 41;
        match(TOKEN_NUM);
        state = 42;
        match(TOKEN_T__9);
        state = 43;
        match(TOKEN_NUM);
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 44;
        match(TOKEN_NUM);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  @override
  bool sempred(RuleContext? _localctx, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
    case 1:
      return _expression_sempred(_localctx as ExpressionContext?, predIndex);
    }
    return true;
  }
  bool _expression_sempred(dynamic _localctx, int predIndex) {
    switch (predIndex) {
      case 0: return precpred(context, 4);
      case 1: return precpred(context, 3);
      case 2: return precpred(context, 2);
    }
    return true;
  }

  static const List<int> _serializedATN = [
      4,1,13,48,2,0,7,0,2,1,7,1,2,2,7,2,1,0,1,0,1,0,1,0,1,0,3,0,12,8,0,1,
      1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,24,8,1,1,1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,1,5,1,35,8,1,10,1,12,1,38,9,1,1,2,1,2,1,2,1,2,1,2,
      1,2,3,2,46,8,2,1,2,0,1,2,3,0,2,4,0,2,1,0,5,7,1,0,8,9,52,0,11,1,0,0,
      0,2,23,1,0,0,0,4,45,1,0,0,0,6,7,3,2,1,0,7,8,5,1,0,0,8,9,5,12,0,0,9,
      12,1,0,0,0,10,12,3,2,1,0,11,6,1,0,0,0,11,10,1,0,0,0,12,1,1,0,0,0,13,
      14,6,1,-1,0,14,15,5,11,0,0,15,16,3,2,1,0,16,17,5,2,0,0,17,24,1,0,0,
      0,18,19,5,3,0,0,19,20,3,2,1,0,20,21,5,2,0,0,21,24,1,0,0,0,22,24,3,
      4,2,0,23,13,1,0,0,0,23,18,1,0,0,0,23,22,1,0,0,0,24,36,1,0,0,0,25,26,
      10,4,0,0,26,27,5,4,0,0,27,35,3,2,1,5,28,29,10,3,0,0,29,30,7,0,0,0,
      30,35,3,2,1,4,31,32,10,2,0,0,32,33,7,1,0,0,33,35,3,2,1,3,34,25,1,0,
      0,0,34,28,1,0,0,0,34,31,1,0,0,0,35,38,1,0,0,0,36,34,1,0,0,0,36,37,
      1,0,0,0,37,3,1,0,0,0,38,36,1,0,0,0,39,40,7,1,0,0,40,46,3,4,2,0,41,
      42,5,12,0,0,42,43,5,10,0,0,43,46,5,12,0,0,44,46,5,12,0,0,45,39,1,0,
      0,0,45,41,1,0,0,0,45,44,1,0,0,0,46,5,1,0,0,0,5,11,23,34,36,45
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ResultContext extends ParserRuleContext {
  ExpressionContext? expression() => getRuleContext<ExpressionContext>(0);
  TerminalNode? NUM() => getToken(OtterParser.TOKEN_NUM, 0);
  ResultContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_result;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is OtterListener) listener.enterResult(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is OtterListener) listener.exitResult(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is OtterVisitor<T>) {
     return visitor.visitResult(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class ExpressionContext extends ParserRuleContext {
  TerminalNode? FN() => getToken(OtterParser.TOKEN_FN, 0);
  List<ExpressionContext> expressions() => getRuleContexts<ExpressionContext>();
  ExpressionContext? expression(int i) => getRuleContext<ExpressionContext>(i);
  NumberContext? number() => getRuleContext<NumberContext>(0);
  ExpressionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_expression;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is OtterListener) listener.enterExpression(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is OtterListener) listener.exitExpression(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is OtterVisitor<T>) {
     return visitor.visitExpression(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

class NumberContext extends ParserRuleContext {
  NumberContext? number() => getRuleContext<NumberContext>(0);
  List<TerminalNode> NUMs() => getTokens(OtterParser.TOKEN_NUM);
  TerminalNode? NUM(int i) => getToken(OtterParser.TOKEN_NUM, i);
  NumberContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_number;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is OtterListener) listener.enterNumber(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is OtterListener) listener.exitNumber(this);
  }
  @override
  T? accept<T>(ParseTreeVisitor<T> visitor) {
    if (visitor is OtterVisitor<T>) {
     return visitor.visitNumber(this);
    } else {
    	return visitor.visitChildren(this);
    }
  }
}

