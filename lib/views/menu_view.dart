import 'package:first_game/constants/colors_constants.dart';
import 'package:first_game/core/base.dart';
import 'package:flutter/material.dart';

import 'game_view.dart';

class Menu extends StatelessWidget with Base {
  static String routeName = "/menu";
  //const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(menu),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                        child: Text(gameName,
                            style: Theme.of(context).textTheme.headline3)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.instance.colorDark,
                      ),
                      //color:
                      child: IconButton(
                        icon: iconConstant.startIcon,
                        //splashColor: colorConstant.colorTrans,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyGame()));
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.instance.colorDark,
                    ),
                    child: IconButton(
                      icon: iconConstant.settingIcon,
                      onPressed: () {
                        Navigator.pushNamed(context, "/setting");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.instance.colorDark,
                    ),
                    child: IconButton(
                      icon: iconConstant.closeIcon,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.instance.colorDark,
                    ),
                    child: IconButton(
                      icon: iconConstant.worldIcon,
                      onPressed: () {
                        Navigator.pushNamed(context, "/recordsScreen");
                      },
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
