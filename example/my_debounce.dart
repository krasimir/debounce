import '../lib/my_debounce.dart';

int value = 0;

void main() async {
  Debouncer d = Debouncer(time: Duration(milliseconds: 100));
  Function func = d.debounce(() {
    value += 1;
  });

  func();
  func();
  func();
  func();

  // We wait a bit before checking the result. If we pass
  // `leading = true` in the constructor our function will be called
  // in the beginning of the period so we won't need this delay here.
  await Future.delayed(Duration(milliseconds: 110));

  print(value); // 1
}
