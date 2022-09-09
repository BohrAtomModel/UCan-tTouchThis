import 'package:first_game/core/base.dart';
import 'package:first_game/views/game_view.dart';
import 'package:first_game/views/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishScreen extends StatelessWidget with Base {
  static String routeName = "/finisScreen";
  @override
  double score;
  double bestScore;

  FinishScreen(this.score, this.bestScore);

  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstant.colorDark,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Text(
                  timesUp,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: colorConstant.colorWhite),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Best Score :${bestScore.toPrecision(3)}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: colorConstant.colorWhite),
                ),
              ),
              Expanded(
                  child: Text(
                "$yourScore: ${score.toPrecision(3)} ",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: colorConstant.colorWhite),
              )),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorConstant.colorWhite,
                  ),
                  //color:
                  child: IconButton(
                    icon: iconConstant.restartIcon,
                    //splashColor: colorConstant.colorTrans,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyGame()));
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorConstant.colorWhite,
                  ),
                  //color:
                  child: IconButton(
                    icon: iconConstant.menuIcon,
                    //splashColor: colorConstant.colorTrans,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Menu()));
                    },
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class TimerSend {
  double second = 5;
  TimerSend(this.second);
}
