import 'package:first_game/constants/colors_constants.dart';
import 'package:first_game/constants/icon_constants.dart';

abstract class Base {
  ColorConstant colorConstant = ColorConstant.instance;
  IconConstant iconConstant = IconConstant.instance;
  double second = 5;
  double score = 0.0;

  //Menu string const
  String menu = "Menu";
  String gameName = "U Can't Touch";

  //Game page string const
  String levels = "Level";
  String scores = "Score";
  String timeLeft = "Time Left";

  //Last page string const
  String timesUp = "Time's Up!";
  String yourScore = "Your Score";
}
