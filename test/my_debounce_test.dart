import '../lib/my_debounce.dart';
import 'package:test/test.dart';

void main() {
  test('should debounce a function call', () async {
    int incWith = 1;
    int value = 0;
    Debouncer d = Debouncer(time: Duration(milliseconds: 100));
    Function f = () {
      value += incWith;
    };

    d.debounce(f);
    incWith = 2;
    d.debounce(f);
    incWith = 3;
    d.debounce(f);
    incWith = 4;
    d.debounce(f);

    await Future.delayed(Duration(milliseconds: 110));

    expect(value, 4);
  });
  test('should all a reuse of the same debouncer class', () async {
    int value = 0;
    Debouncer d = Debouncer(time: Duration(milliseconds: 50));
    Function f = () {
      value += 1;
    };

    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    await Future.delayed(Duration(milliseconds: 60));
    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    await Future.delayed(Duration(milliseconds: 60));

    expect(value, 2);
  });
  test('should owner the leading flag', () async {
    int value = 0;
    Debouncer d = Debouncer(time: Duration(milliseconds: 50), leading: true);
    Function f = () {
      value += 1;
    };

    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    expect(value, 1);
    await Future.delayed(Duration(milliseconds: 60));
    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    d.debounce(f);
    expect(value, 2);
    await Future.delayed(Duration(milliseconds: 60));

    expect(value, 2);
  });
}
