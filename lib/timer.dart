import 'dart:async';

import 'package:get/get.dart';

import 'main.dart';

class timer extends GetxController {
  game test = game();
  var second = 4.500;
  late Timer _timer;
  double getSecond() {
    return second;
  }

  void countDown() {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (second > 0) {
        second = second - (0.0016666667);
        update();
      } else {
        timer.cancel();
      }
    });
  }

  void reset() {
    _timer.cancel();
    second = 4.5;
  }
}
