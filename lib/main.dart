import 'package:firebase_core/firebase_core.dart';
import 'package:first_game/core/base.dart';
import 'package:first_game/views/finish_view.dart';
import 'package:first_game/views/game_view.dart';
import 'package:first_game/views/menu_view.dart';
import 'package:first_game/views/records_view.dart';
import 'package:first_game/views/settings_view.dart';
import 'package:first_game/views/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  var box = Hive.openBox('dataBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget with Base {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MaterialApp",
      initialRoute: "/signInScreen",
      routes: {
        Menu.routeName: (context) => Menu(),
        SignInScreen.routeName: (context) => SignInScreen(),
        MyGame.routeName: (context) => MyGame(),
        SettingsView.routeName: (context) => const SettingsView(),
        FinishScreen.routeName: (context) => FinishScreen(score, 0),
        RecordsScreen.routeName: (context) => const RecordsScreen()
      },
    );
  }
}
