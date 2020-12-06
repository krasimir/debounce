import 'dart:async';

const DEFAULT_TIME = Duration(milliseconds: 100);

class Debouncer {
  Duration time;
  bool leading;
  Timer timer;
  Function callback;

  Debouncer({this.time = DEFAULT_TIME, this.leading = false});

  Function debounce(Function c) {
    callback = c;
    if (timer == null) {
      if (leading) {
        callback();
      }
      timer = new Timer(this.time, () {
        timer = null;
        if (!leading) {
          callback();
        }
      });
    }
  }
}
