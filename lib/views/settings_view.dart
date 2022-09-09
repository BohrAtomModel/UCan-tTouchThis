import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  static String routeName = "/settingsView";
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Setting"),
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                child: const Text("Voice"),
              ))
            ],
          )),
        ),
      ),
    );
  }
}
