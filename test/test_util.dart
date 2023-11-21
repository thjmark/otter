import 'package:test/test.dart';

void testFloatEquals(num value, num expectedValue) {
  expect((value - expectedValue).abs(), lessThan(value.abs() * 0.001));
}
