# debounce

Dart package for exactly what you are thinking about - debouncing a function call.

```dart
void main() async {
  Debouncer d = Debouncer(time: Duration(milliseconds: 100));

  Function func = () {
    value += 1;
  };

  d.debounce(func);
  d.debounce(func);
  d.debounce(func);
  d.debounce(func);

  await Future.delayed(Duration(milliseconds: 110));

  print(value); // 1
}
```

The `Debouncer` class has an optional named parameter called `leading`. If you set it to `true` your callback will be fired immediately. For example:

```dart
void main() async {
  Debouncer d = Debouncer(time: Duration(milliseconds: 100, leading: true));

  Function func = () {
    value += 1;
  };

  d.debounce(func); // at this point value is 1
  d.debounce(func); // nothing happens
  d.debounce(func); // nothing happens
  d.debounce(func); // nothing happens
}
```

---

This library exists to satisfy the need of debouncing callbacks passed to methods like `onPanUpdate`. For example:

```dart
Debouncer d = Debouncer(time: Duration(milliseconds: 300));
...
GestureDetector(
  onPanUpdate: (details) {
    d.debounce(() {
      if (details.delta.dx > 0) {
        print('left');
      } else {
        print('right');
      }
    });
  },
```
