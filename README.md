# Otter
Otter is a command line application that allows the user to evaluate a numerical expression in arbitary bases.
The numerical expression is supplied in the form of a string.
e.g. 
```
otter.ext "17+4*32 + 2.3="
```
Otter works with different numerical bases i.e. Base 2 (binary), Base 16(hexadecimal)
## Input format
- Numbers 
    - Digits [0-9][A-Z][a-z] e.g. A in Base 16 is 10 in Base 10 z is 61 in Base 62
    - Decimal point [.]
    - Exponent [@] e.g. 1@5 in Base 10 is 10000
    - Number Base (in Base 10) [#] e.g. 15#10 is 15 in Base 10 15#16 is 21 in Base 16 or FF#16 is 255 in Base 16
- Operators
    - Base Operations [+,-,*,/]
    - Exponent [^] i.e. 3^2=9
    - Modulus [%] i.e. 5%3=2
    - Factorial [!] i.e. 6! = 1*2*3*4*5*6 = 120
    - Equal operator [=] finishes the expression (result should be  returned in current base)
    - Equal operator with Base [=#[Base]] i.e. 12=#2=1100
    - Base converter [>]
- Functions
    - sin,cos,tan
    - sqrt
    - asin, acos, atan
    - ln, log (Logarithm to base e and to current base)

## command line flags
- [-f] the calculation is performed as floating point numbers
- [-deg] trigonomertic functions use degrees instead of radians
- [-h] print help message


