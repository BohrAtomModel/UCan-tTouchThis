import 'package:first_game/core/base.dart';
import 'package:first_game/timer.dart';
import 'package:get/get.dart';

class Score with Base {
  final timer time = Get.put(timer());

  void addScore() {
    score = (score + (25 * time.getSecond()));
  }

  double getScore() {
    return score;
  }
}
