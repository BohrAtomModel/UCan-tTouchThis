import 'package:first_game/menu_view.dart';
import 'package:first_game/settings_view.dart';
import 'package:flutter/material.dart';

import 'game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      initialRoute: "/menu",
      routes: {
        "/menu": (context) => const Menu(),
        "/game": (context) => const MyGame(),
        "/setting": (context) => const Settings()
      },
    );
  }
}
