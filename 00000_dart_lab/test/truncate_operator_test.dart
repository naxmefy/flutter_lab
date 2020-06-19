import 'package:test/test.dart';

void main() {

  group('truncate operator', () {
    void check(num a, num b, int expected){
      test('for $a ~/ $b should $expected', () {
        expect(a ~/ b, equals(expected));
      });
    }

    check(3, 1, 3);
    check(3.5, 1, 3);
    check(3.5, 1.2, 2);
  });
}