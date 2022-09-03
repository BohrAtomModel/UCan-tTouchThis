class Level {
  dynamic level = 1;
  int num = 0;

  void increaseLevel() {
    num++;
    num = num % 10;
    if (num == 0) {
      level = level + 1;
    }
  }

  int getLevel() {
    return level;
  }
}
