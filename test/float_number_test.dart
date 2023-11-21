import 'package:otter/number/float_number/float_number.dart';
import 'package:test/test.dart';

void main(){
    test("output floating point number - decimal",(){
      expect(FloatNumber(12.322e23,base: 10).toString(),"1.2322@24");
      expect(FloatNumber(1.322e-23,base: 10).toString(),"1.322@-23");
      expect(FloatNumber(-1.322e-23,base: 10).toString(),"-1.322@-23");
    });

    test("output floating point number - different base",(){
      expect(FloatNumber(1.024e3,base: 2).toString(),"1.0@1010#2");
      expect(FloatNumber(-1.024e3,base: 2).toString(),"-1.0@1010#2");
      expect(FloatNumber(1.023e3,base: 2).toString(),"1.111111111@1001#2");
    });

    test("output 0 ",(){
      expect(FloatNumber(0,base: 10).toString(), "0");
    });

    test("output no exponential if exponential is 0", (){
      expect(FloatNumber(1,base: 2).toString(), "1.0#2");
      expect(FloatNumber(1,base: 10).toString(), "1.0");
    });
}