import 'dart:async';
import 'dart:math';

import 'package:first_game/core/base.dart';
import 'package:get/get.dart';

import 'level.dart';

class timer extends GetxController with Base {
  Level level = Level();
  late Timer timerr;
  var num = 0;
  var decreaseSecond = 0;

  double getSecond() {
    return second;
  }

  void countDown() {
    timerr = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (second > 0.0) {
        second = second - (0.001);
        update();
      } else {
        timer.cancel();
      }
    });
  }

  // I want to add a alert dialog end of the time but I couldn't add
  void reset() {
    num++;
    num = num % 10;
    if (num == 0) {
      decreaseSecond++;
    }
    timerr.cancel();
    second = 5.0 * (pow(0.85, decreaseSecond));
  }
}
