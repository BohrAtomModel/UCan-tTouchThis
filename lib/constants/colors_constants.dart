import 'dart:ui';

//this is constant class. You may create other constant for instance
// padding class and, circular border class.
class ColorConstant {
  static ColorConstant instance = ColorConstant._init();
  ColorConstant._init();

  final colorRed = Color(0xffff0000);
  final colorGreen = Color(0xff04ff00);
  final colorBlue = Color(0xff0047ff);
  final colorDark = Color(0x81000000);
  final colorBlueAccent = Color(0xFF49FFFF);
}
