import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

//part 'user.g.dart';
class UserData {
  final _dataBox = Hive.box("dataBox");

  void saveNickname(String name, String nickname) {
    _dataBox.put(name, nickname);
  }

  String getNickname(String name) {
    return _dataBox.get(name);
  }

  void saveData(String name, double value) {
    _dataBox.put(name, value);
  }

  double getData(String name) {
    return _dataBox.get(name);
  }
}
