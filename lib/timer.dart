import 'dart:async';

import 'package:get/get.dart';

class timer extends GetxController {
  var second = 4.500;
  late Timer _timer;

  double getSecond() {
    return second;
  }

  void countDown() {
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (second > 0) {
        second = second - (0.001666667);
        update();
      } else {
        timer.cancel();
      }
    });
  }

  // I want to add a alert dialog end of the time but I couldn't add
  void reset() {
    _timer.cancel();
    second = 4.5;
  }
}
