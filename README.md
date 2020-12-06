# debounce

Dart package for exactly what you are thinking about - debouncing a function call.

```dart
void main() async {
  Debouncer d = Debouncer(time: Duration(milliseconds: 100));

  Function func = d.debounce(() {
    value += 1;
  });

  func();
  func();
  func();
  func();

  await Future.delayed(Duration(milliseconds: 110));

  print(value); // 1
}
```

The `Debouncer` class has an optional named parameter called `leading`. If you set it to `true` your callback will be fired immediately. For example:

```dart
void main() async {
  Debouncer d = Debouncer(time: Duration(milliseconds: 100, leading: true));

  Function func = d.debounce(() {
    value += 1;
  });

  func(); // at this point value is 1
  func(); // nothing happens
  func(); // nothing happens
  func(); // nothing happens
}
```
