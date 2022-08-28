import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
