import 'package:first_game/level.dart';
import 'package:first_game/score.dart';
import 'package:first_game/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart'; // check ios

import 'visibilities.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  var alert = AlertDialog(
    title: Text("Game Over"),
  );
  //showDialog(context: context, builder: (BuildContext context) => alert); //you have to use this.
  final timer time = Get.put(timer());
  final Score score = Get.put(Score());
  LevelIncrease level = LevelIncrease();
  Visibilities visibleController = Visibilities();
  // AudioPlayer player = AudioPlayer();
  List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int highestPoint = 0;
  int a = 0;
  int visible = 0;

  @override
  Widget build(BuildContext context) {
    visibleController.isVisible();
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
                Expanded(child: SizedBox()),
                Expanded(flex: 2, child: scoreGetBuilder()),
                Expanded(
                  flex: 2,
                  child: leftTime(),
                ),
                //Text("Score $point"),
                Text("Level: ${level.level}"),
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

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("U Can't Touch"),
    );
  }

  //this method get score from score file with getx
  GetBuilder<Score> scoreGetBuilder() {
    return GetBuilder<Score>(
        builder: (builder) =>
            Text("Score: ${score.score.toStringAsPrecision(6)}"));
  }

  //This method get time as millisecond from timer file with getx
  GetBuilder<timer> leftTime() {
    return GetBuilder<timer>(
      builder: (builder) => Text(
        "Time Left: ${time.second.toPrecision(2)} s",
        style: const TextStyle(fontSize: 20),
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
          score.addScore();
          time.reset();
          setState(() {
            Dialog;
            visibleController.isVisible();
            Vibration.vibrate(duration: 50);
            level.increaseLevel();

            //player.play(AssetSource("assets/music.mp3"));
          });
        },
        child: Container(
          color: ctcolor,
          height: 95,
          width: 95,
          child: Center(
            child: Text(
              "${level.num + 1}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
