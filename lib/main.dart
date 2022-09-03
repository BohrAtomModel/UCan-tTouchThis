import 'package:first_game/core/base.dart';
import 'package:first_game/finish_view.dart';
import 'package:first_game/game_view.dart';
import 'package:first_game/menu_view.dart';
import 'package:first_game/settings_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with Base {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MaterialApp",
      initialRoute: "/menu",
      routes: {
        Menu.routeName: (context) => Menu(),
        MyGame.routeName: (context) => MyGame(second),
        Settings.routeName: (context) => Settings(),
        FinishScreen.routeName: (context) => FinishScreen(score),
      },
    );
  }
}
