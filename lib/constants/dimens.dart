import 'package:flutter/material.dart';

class Dimens {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
  static double getTopSafeAreaHeight(BuildContext context) {
    return MediaQuery.paddingOf(context).top;
  }
}