class LevelIncrease {
  int level = 1;
  int num = 0;

  int getLevel() {
    return level;
  }

  void increaseLevel() {
    num++;
    num = num % 10;
    if (num == 0) {
      level++;
    }
  }
}
