
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MQColor {

  static const Color primaryColor = Color(0xff2EC4B6);
  static const Color secondaryColor = Color(0xff90caf9); // Colors.blue.shade200
  static const Color bgColorDarker = Color(0xff111518);
  static const Color bgColorDark = Color(0xff1B2125);
  static const Color bgColorLight = Color(0xff262D34);
  static const Color textColor = Color(0xfffdfffc);
  static const Color textColorInverse = Color(0xff111518);
  static const Color textColorDisabled = Color(0xff949494);
  static const Color transparent = Colors.transparent;

  static const Color actionButtonTextColor = bgColorDark;
  static const Color inputFormFieldBackground = bgColorLight;

  static final Color accentOrange = Colors.orange.shade100;
  static final Color accentYellow = Colors.yellow.shade100;
  static final Color accentGreen = Colors.green.shade100;
  static const Color accentRedAccent = Color(0xffff8a80); // shade 100
  static final Color accentPink = Colors.pink.shade200;

  static const Color formErrorHint = Colors.orangeAccent;
  static const Color error = formErrorHint; // shade 100
  static const Color fatalError = Color(0xffef5350); // shade 100
  // static const Color fatalError = Color(0xffd32f2f); // shade 100

  static const Color systemNavBar = MQColor.bgColorDark;
  static const Brightness systemNavBarBrightness = Brightness.light;

  // static const Color systemNavBar = MQColor.bgColorDark;
  // static const Brightness systemNavBarBrightness = Brightness.light;
  //
  // static const Color bottomNavBar = Colors.white;
  // static const Brightness bottomNavBarBrightness = Brightness.dark;

}