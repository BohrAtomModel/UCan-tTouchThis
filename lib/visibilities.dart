import 'dart:math';

class Visibilities {
  //beginning of the game all of containers are invisible then randomly int value chooses a container to become visible
  int random = 0;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;
  bool visible5 = false;
  bool visible6 = false;
  bool visible7 = false;
  bool visible8 = false;
  bool visible9 = false;

  isVisible() {
    // I didn't find another way without use if else
    random = Random().nextInt(9) + 1;
    if (random == 1) {
      visible1 = true;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 2) {
      visible2 = true;
      visible1 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 3) {
      visible3 = true;
      visible1 = false;
      visible2 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 4) {
      visible4 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 5) {
      visible5 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 6) {
      visible6 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 7) {
      visible7 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible8 = false;
      visible9 = false;
    } else if (random == 8) {
      visible8 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible9 = false;
    } else if (random == 9) {
      visible9 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
    }
  }
}
