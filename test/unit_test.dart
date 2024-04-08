import 'package:flutter_test/flutter_test.dart';
import 'package:youapp_frontend/core/core.dart';

void main() {
  test('Get Zodiac By Date', () {
    DateTime date = DateTime(2022, 3, 5);
    String zodiac = Zodiac.getByDate(date);

    expect(zodiac, 'Tiger');
  });

  test('Get Horoscope By Date', () {
    DateTime date = DateTime(2022, 3, 25);
    String horoscope = Horoscope.getByDate(date);

    expect(horoscope, 'Aries');
  });
}
