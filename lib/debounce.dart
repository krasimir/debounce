import 'dart:async';

const DEFAULT_TIME = Duration(milliseconds: 100);

class Debouncer {
  Duration time;
  bool leading;
  Timer timer;

  Debouncer({this.time = DEFAULT_TIME, this.leading = false});

  Function debounce(Function callback) {
    return () {
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
    };
  }
}
