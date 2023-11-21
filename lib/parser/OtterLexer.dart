// Generated from Otter.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class OtterLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.11.1', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, TOKEN_T__4 = 5, 
    TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_T__7 = 8, TOKEN_T__8 = 9, TOKEN_T__9 = 10, 
    TOKEN_T__10 = 11, TOKEN_T__11 = 12, TOKEN_FN = 13, TOKEN_NUM = 14, TOKEN_WHITESPACE = 15;
  @override
  final List<String> channelNames = [
    'DEFAULT_TOKEN_CHANNEL', 'HIDDEN'
  ];

  @override
  final List<String> modeNames = [
    'DEFAULT_MODE'
  ];

  @override
  final List<String> ruleNames = [
    'T__0', 'T__1', 'T__2', 'T__3', 'T__4', 'T__5', 'T__6', 'T__7', 'T__8', 
    'T__9', 'T__10', 'T__11', 'FN', 'NUM', 'WHITESPACE'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'=#'", "')'", "'('", "'^'", "'*'", "'/'", "'%'", "'+'", "'-'", 
      "'.'", "'@'", "'#'", null, null, "' '"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, null, null, null, 
      null, null, "FN", "NUM", "WHITESPACE"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }


  OtterLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'Otter.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,15,72,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,
      7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
      2,14,7,14,1,0,1,0,1,0,1,1,1,1,1,2,1,2,1,3,1,3,1,4,1,4,1,5,1,5,1,6,
      1,6,1,7,1,7,1,8,1,8,1,9,1,9,1,10,1,10,1,11,1,11,1,12,4,12,58,8,12,
      11,12,12,12,59,1,12,1,12,1,13,4,13,65,8,13,11,13,12,13,66,1,14,1,14,
      1,14,1,14,0,0,15,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,8,17,9,19,10,21,
      11,23,12,25,13,27,14,29,15,1,0,2,1,0,97,122,3,0,48,57,65,90,97,122,
      73,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,11,
      1,0,0,0,0,13,1,0,0,0,0,15,1,0,0,0,0,17,1,0,0,0,0,19,1,0,0,0,0,21,1,
      0,0,0,0,23,1,0,0,0,0,25,1,0,0,0,0,27,1,0,0,0,0,29,1,0,0,0,1,31,1,0,
      0,0,3,34,1,0,0,0,5,36,1,0,0,0,7,38,1,0,0,0,9,40,1,0,0,0,11,42,1,0,
      0,0,13,44,1,0,0,0,15,46,1,0,0,0,17,48,1,0,0,0,19,50,1,0,0,0,21,52,
      1,0,0,0,23,54,1,0,0,0,25,57,1,0,0,0,27,64,1,0,0,0,29,68,1,0,0,0,31,
      32,5,61,0,0,32,33,5,35,0,0,33,2,1,0,0,0,34,35,5,41,0,0,35,4,1,0,0,
      0,36,37,5,40,0,0,37,6,1,0,0,0,38,39,5,94,0,0,39,8,1,0,0,0,40,41,5,
      42,0,0,41,10,1,0,0,0,42,43,5,47,0,0,43,12,1,0,0,0,44,45,5,37,0,0,45,
      14,1,0,0,0,46,47,5,43,0,0,47,16,1,0,0,0,48,49,5,45,0,0,49,18,1,0,0,
      0,50,51,5,46,0,0,51,20,1,0,0,0,52,53,5,64,0,0,53,22,1,0,0,0,54,55,
      5,35,0,0,55,24,1,0,0,0,56,58,7,0,0,0,57,56,1,0,0,0,58,59,1,0,0,0,59,
      57,1,0,0,0,59,60,1,0,0,0,60,61,1,0,0,0,61,62,5,40,0,0,62,26,1,0,0,
      0,63,65,7,1,0,0,64,63,1,0,0,0,65,66,1,0,0,0,66,64,1,0,0,0,66,67,1,
      0,0,0,67,28,1,0,0,0,68,69,5,32,0,0,69,70,1,0,0,0,70,71,6,14,0,0,71,
      30,1,0,0,0,3,0,59,66,1,6,0,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}