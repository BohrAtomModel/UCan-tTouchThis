import 'dart:math';

class cloak extends Visibilities {
  /*iCloak(
      @required bool this.visible1,
      @required bool v2,
      @required bool v3,
      @required bool v4,
      @required bool v5,
      @required bool v6,
      @required bool v7,
      @required bool v8,
      @required bool v9) {


    v2 = this.visible2;
    v3 = this.visible3;
    v4 = this.visible4;
    v5 = this.visible5;
    v6 = this.visible6;
    v7 = this.visible7;
    v8 = this.visible8;
    v9 = this.visible9;
  }*/
}

class Visibilities {
  int visible = 0;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;
  bool visible5 = false;
  bool visible6 = false;
  bool visible7 = false;
  bool visible8 = false;
  bool visible9 = false;

  /* List<cloak> Viss = [
    cloak()
        .iCloak(true, false, false, false, false, false, false, false, false),
    cloak()
        .iCloak(false, true, false, false, false, false, false, false, false),
    cloak()
        .iCloak(false, false, true, false, false, false, false, false, false),
    cloak()
        .iCloak(false, false, false, true, false, false, false, false, false),
    cloak()
        .iCloak(false, false, false, false, true, false, false, false, false),
    cloak()
        .iCloak(false, false, false, false, false, true, false, false, false),
    cloak()
        .iCloak(false, false, false, false, false, false, true, false, false),
    cloak()
        .iCloak(false, false, false, false, false, false, false, true, false),
    cloak().iCloak(
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      true,
    )
  ];*/
  isVisible() {
    visible = Random().nextInt(9) + 1;
    if (visible == 1) {
      visible1 = true;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 2) {
      visible2 = true;
      visible1 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 3) {
      visible3 = true;
      visible1 = false;
      visible2 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 4) {
      visible4 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 5) {
      visible5 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible6 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 6) {
      visible6 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible7 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 7) {
      visible7 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible8 = false;
      visible9 = false;
    } else if (visible == 8) {
      visible8 = true;
      visible1 = false;
      visible2 = false;
      visible3 = false;
      visible4 = false;
      visible5 = false;
      visible6 = false;
      visible7 = false;
      visible9 = false;
    } else if (visible == 9) {
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
