import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF39A9DB);
const kBackgroundColor = Color(0xFFFFFFFF);
const kErrorColor = Color(0xFFD63230);

class Config {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}