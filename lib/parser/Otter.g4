grammar Otter;

result: expression'=#'NUM
        |expression;

expression: FN expression')'
            |'('expression')'
            |expression'^'expression
            |expression('*'|'/'|'%')expression
            |expression('+'|'-')expression
            |number
           ;
number: NUM'#'NUM
        |NUM;


FN: ([a-z])+'(';
NUM: ([0-9A-Za-z])+;
WHITESPACE:' '-> skip;