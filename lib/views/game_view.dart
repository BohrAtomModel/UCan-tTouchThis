import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_game/core/base.dart';
import 'package:first_game/level.dart';
import 'package:first_game/score.dart';
import 'package:first_game/timer.dart';
import 'package:first_game/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart'; // check ios

import '../visibilities.dart';
import 'finish_view.dart';

class MyGame extends StatefulWidget {
  static String routeName = "/game";
  @override
  State<MyGame> createState() => MyGameState();
}

class MyGameState extends State<MyGame> with Base {
  double dynamicSize(double value) =>
      MediaQuery.of(context).size.height * value;
  final timer time = Get.put(timer());
  final Score newScore = Score();
  Level level = Level();
  Visibilities visibleController = Visibilities();
  double _highScore = 0;
  UserData userData = UserData();
  // AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    firebaseSave();
    readyForScreen();
  }

  void readyForScreen() async {
    _highScore = userData.getData('bestScore');
    setState(() {});
  }

  void saveScore() {
    if (newScore.score > _highScore) {
      userData.saveData('bestScore', newScore.score);
      _highScore = userData.getData('bestScore');
    }
  }

  void timeChecker() {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (time.second <= 0.0) {
        time.timerr.cancel();
        time.num = 0;
        time.decreaseSecond = 0;
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FinishScreen(newScore.score, _highScore)));
        time.second = 5;
        firebaseSave();
      }
    });
  }

  void firebaseSave() {
    _highScore = userData.getData('bestScore');
    FirebaseFirestore.instance
        .collection('Scores')
        .doc(userData.getNickname('nickname'))
        .set({'name': userData.getNickname('nickname'), 'score': _highScore});
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
                Expanded(
                    child: Text("Best Score: ${_highScore.toPrecision(3)}",
                        style: const TextStyle(fontSize: 18))),
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
      child: SizedBox(
        width: dynamicSize(0.12),
        height: dynamicSize(0.12),
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          onPressed: () {
            newScore.addScore();
            time.reset();
            visibleController.isVisible();
            setState(() {
              saveScore();
              Vibration.vibrate(duration: 50);
              level.increaseLevel();
              //player.play(AssetSource("assets/music.mp3"));
            });
          },
          child: Container(
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
      ),
    );
  }
}
