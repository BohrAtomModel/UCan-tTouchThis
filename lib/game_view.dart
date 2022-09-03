import 'dart:async';

import 'package:first_game/core/base.dart';
import 'package:first_game/level.dart';
import 'package:first_game/score.dart';
import 'package:first_game/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart'; // check ios

import 'finish_view.dart';
import 'visibilities.dart';

class MyGame extends StatefulWidget {
  static String routeName = "/game";
  double second;
  MyGame(this.second, {super.key}) {}
  @override
  State<MyGame> createState() => MyGameState();
}

class MyGameState extends State<MyGame> with Base {
  final timer time = Get.put(timer());
  final Score newScore = Score();
  Level level = Level();
  Visibilities visibleController = Visibilities();

  // AudioPlayer player = AudioPlayer();
  //List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int highestPoint = 0;
  int a = 0;
  int visible = 0;

  void timeChecker() {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (time.second <= 0.0) {
        timer.cancel();
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FinishScreen(newScore.score)));
        time.timerr.cancel();
        time.second = 5;
        //level.level = 1;
        time.num = 0;
        time.decreaseSecond = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (newScore.score == 0) {
      visibleController.isVisible();
    }
    timeChecker();
    time.countDown();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(child: SizedBox()),
                Expanded(flex: 2, child: scoreGetBuilder()),
                Expanded(flex: 2, child: leftTime()),
                levelText(),
                Expanded(
                  flex: 3,
                  child: firstRow(),
                ),
                Expanded(
                  flex: 3,
                  child: secondRow(),
                ),
                Expanded(
                  flex: 3,
                  child: thirdRow(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text levelText() => Text(
        "$levels: ${level.level}",
        style: const TextStyle(fontSize: 16),
      );

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(gameName),
    );
  }

  //this method get score from score file with getx
  Text scoreGetBuilder() {
    return Text(
      "$scores: ${newScore.score.toPrecision(3)}",
      style: const TextStyle(fontSize: 18),
    );
  }

  //This method get time as millisecond from timer file with getx
  GetBuilder<timer> leftTime() {
    return GetBuilder<timer>(
      builder: (builder) => Text(
        "$timeLeft: ${time.second.toPrecision(3)} s",
        style: const TextStyle(fontSize: 25),
      ),
    );
  }

  Row firstRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      buildVisibility(
          visibleController.visible1, Colors.white, Colors.blueAccent),
      buildVisibility(
          visibleController.visible2, Colors.white, Colors.redAccent),
      buildVisibility(
          visibleController.visible3, Colors.white, Colors.greenAccent),
    ]);
  }

  Row secondRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      buildVisibility(
          visibleController.visible4, Colors.white, Colors.blueAccent),
      buildVisibility(
          visibleController.visible5, Colors.white, Colors.redAccent),
      buildVisibility(
          visibleController.visible6, Colors.white, Colors.greenAccent),
    ]);
  }

  Row thirdRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      buildVisibility(
          visibleController.visible7, Colors.white, Colors.blueAccent),
      buildVisibility(
          visibleController.visible8, Colors.white, Colors.redAccent),
      buildVisibility(
          visibleController.visible9, Colors.white, Colors.greenAccent),
    ]);
  }

  //This method controls containers which one will be visible with visibilities file
  Visibility buildVisibility(bool visiblee, Color spcolor, Color ctcolor) {
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      maintainSize: true,
      visible: visiblee,
      child: FlatButton(
        padding: const EdgeInsets.all(0),
        splashColor: spcolor,
        onPressed: () {
          newScore.addScore();
          time.reset();
          visibleController.isVisible();
          setState(() {
            Vibration.vibrate(duration: 50);
            level.increaseLevel();

            //player.play(AssetSource("assets/music.mp3"));
          });
        },
        child: Container(
          height: 95,
          width: 95,
          decoration: BoxDecoration(
            color: ctcolor,
            boxShadow: [
              BoxShadow(
                color: colorConstant.colorDark,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: colorConstant.colorWhite,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
