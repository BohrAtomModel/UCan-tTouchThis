import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static String routeName = "/settings";
  const Settings({Key? key}) : super(key: key);

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
