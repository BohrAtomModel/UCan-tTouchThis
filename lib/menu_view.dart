import 'package:first_game/constants/colors_constants.dart';
import 'package:first_game/settings_view.dart';
import 'package:flutter/material.dart';

import 'constants/icon_constants.dart';
import 'game_view.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Menu"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: const Center(child: Text("Game Name")),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 200,
                      color: ColorConstant.instance.colorDark,
                      child: IconButton(
                        icon: IconConstant.instance.startIcon,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyGame()));
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  child: Container(
                    width: 200,
                    color: ColorConstant.instance.colorDark,
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  child: Container(
                    width: 200,
                    color: ColorConstant.instance.colorDark,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
