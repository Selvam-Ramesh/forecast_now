import 'package:flutter/material.dart';

extension UIExt on BuildContext {
  double topSpace() => MediaQuery.of(this).padding.top;
  double appBarHeight() => AppBar().preferredSize.height;
  ThemeData appTheme() => Theme.of(this);
  TextTheme appTextTheme() => Theme.of(this).textTheme;
  Size screenSize() => MediaQuery.of(this).size;
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.width;


}

