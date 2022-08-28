import 'package:first_game/timer.dart';
import 'package:get/get.dart';

class Score extends GetxController {
  final timer time = Get.put(timer());
  RxDouble score = 0.0.obs;

  void addScore() {
    score = (score + (25 * time.getSecond())) as RxDouble;
  }
}
