class HelpText{
  static String text ="""
  otter \"expression\" <flags>
  -----------------------------
  valid flags:
      -f : Perform calculations with floating point numbers. If this parameter is not set all evaluations are performed 
      -deg: use degrees instead of radians for trigonometric functions
      -h : print this message
      
  expression:
  expression to calculate the following notation is used:
  Whole number << (-)[digits...]#base >> base defines the base of the number (in base 10). The digits of the number are 
  used in the following order: [0-9A-Za-z] (thus otter can calculate in any base up to 62)
  e.g. 1F#16 is the hexadecimal number with the decimal value 31
  If base=10 the #base part can be omitted. The sign - is optional.
   
  Floating point number << (-)[digits..].[digits]@(-)[digits for exponent]#base >>   
  Decimal floating point numbers are usually written in the form e.g. 2.32e15 for 2.32*10^15.
  In otter the e for 10^ is replaced by @ for base^.
  
  The expression can be a regular mathematical expression with regular brackets () and 
      +,-,*,/ for addition, subtraction, multiplication, division
      x%y the remainder of the division of x by y
      x^y for x to the power of y
      x! for factorial of x 
      fn(x) apply function fn on x : 
        valid functions are 
        sqrt (square root),
        ln (natural logarithm),
        log (logarithm to current base),
        sin (sinus)
        cos (cosinus)
        tan (tangens)
        asin (reverse function of sin)
        acos (reverse function of cos)
        atan (reverse function of tan)
                       
      x>newBase convert x to newBase
      expression=#base return result to base before it is printed
  """;
}