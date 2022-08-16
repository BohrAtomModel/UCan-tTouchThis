//import 'package:audioplayers/audioplayers.dart';
import 'package:first_game/level.dart';
import 'package:first_game/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import 'visibilities.dart';

class game {
  Visibilities visibleController = Visibilities();
  void finish() {
    visibleController.visible1 = false;
    visibleController.visible2 = false;
    visibleController.visible3 = false;
    visibleController.visible4 = false;
    visibleController.visible5 = false;
    visibleController.visible6 = false;
    visibleController.visible7 = false;
    visibleController.visible8 = false;
    visibleController.visible9 = false;
  }
}

void main() {
  runApp(const MyGame());
}

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  final timer time = Get.put(timer());
  LevelIncrease Level = LevelIncrease();
  Visibilities visibleController = Visibilities();
  // AudioPlayer player = AudioPlayer();
  List<int> text = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int point = 0;
  int highestPoint = 0;
  int a = 0;
  int visible = 0;

  @override
  Widget build(BuildContext context) {
    time.countDown();
    visibleController.isVisible();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("U Can't Touch"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: GetBuilder<timer>(
                    builder: (builder) => Text(
                      "Time Left: ${time.second.toPrecision(2)} s",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                //Text("Score $point"),
                Text("Level: ${Level.level}"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildVisibility(visibleController.visible1, Colors.white,
                          Colors.blueAccent),
                      buildVisibility(visibleController.visible2, Colors.white,
                          Colors.redAccent),
                      buildVisibility(visibleController.visible3, Colors.white,
                          Colors.greenAccent),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildVisibility(visibleController.visible4, Colors.white,
                          Colors.blueAccent),
                      buildVisibility(visibleController.visible5, Colors.white,
                          Colors.redAccent),
                      buildVisibility(visibleController.visible6, Colors.white,
                          Colors.greenAccent),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildVisibility(visibleController.visible7, Colors.white,
                          Colors.blueAccent),
                      buildVisibility(visibleController.visible8, Colors.white,
                          Colors.redAccent),
                      buildVisibility(visibleController.visible9, Colors.white,
                          Colors.greenAccent),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
          time.reset();
          setState(() {
            Vibration.vibrate(duration: 50);
            point = point + (100 * time.second * Level.level) as int;
            Level.increaseLevel();
            visibleController.isVisible();

            //player.play(AssetSource("assets/music.mp3"));
          });
        },
        child: Container(
          height: 95,
          width: 95,
          color: ctcolor,
          child: Center(
            child: Text(
              "${Level.num + 1}",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
