grammar Otter;

result: expression'=#'NUM
        |expression;

expression: FN expression')'
            |'('expression')'
            |expression'>'NUM
            |expression'^'expression
            |expression'!'
            |expression('*'|'/'|'%')expression
            |expression('+'|'-')expression
            |number
           ;
number: ('-'|'+')number #sign
        |NUM'.'NUM'@'('-'|'+')?NUM'#'NUM #float
        |NUM'.'NUM'@'('-'|'+')?NUM #floatBase10
        |NUM'.'NUM'#'NUM #decimal
        |NUM'.'NUM #decimalBase10
        |NUM'#'NUM #int
        |NUM #intBase10
        ;


FN: ([a-z])+'(';
NUM: ([0-9A-Za-z])+;
WHITESPACE:' '-> skip;