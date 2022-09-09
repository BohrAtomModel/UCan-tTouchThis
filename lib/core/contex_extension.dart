import 'package:flutter/material.dart';

extension ContexExtension on BuildContext {
  double dynamicSize(double value) => MediaQuery.of(this).size.height * value;
}
