

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/constants/color.dart';

class MQTheme {

  static const uiScale = 0.8;

  static const brightness = Brightness.dark;

  static const Radius radiusScreen = Radius.circular(50.0 * uiScale);
  static const Radius radiusCard = Radius.circular(35.0 * uiScale);
  static const Radius radiusElement = Radius.circular(25.0 * uiScale);
  static const Radius radiusElementSmall = Radius.circular(15.0 * uiScale);

  static const String fontFamily = 'Montserrat';
  static const String fontFamily2 = 'Montserrat';

  static TextStyle logoTitle = const TextStyle(
      color: MQColor.textColor,
      fontSize: 36 * uiScale,
      fontWeight: FontWeight.bold
  );

  // ------------------------------------------------------

  static TextStyle title1 = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 40 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title2 = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 30 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title3 = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 22 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title4 = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 20 * uiScale,
    fontWeight: FontWeight.w600,
  );

  // ------------------------------------------------------

  static TextStyle subtitle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.primaryColor,
    fontSize: 24 * uiScale,
  );

  static TextStyle subtitle2 = subtitle.copyWith(
      fontWeight: FontWeight.bold
  );

  static TextStyle defaultTextStyle = const TextStyle(
      fontFamily: fontFamily,
      color: MQColor.textColor,
      fontSize: 22 * uiScale,
      fontWeight: FontWeight.normal
  );

  static const TextStyle defaultSmallTextStyle = TextStyle(
      fontFamily: fontFamily,
      color: MQColor.textColorDisabled,
      fontSize: 18 * uiScale,
      fontWeight: FontWeight.w500
  );

  static const TextStyle errorNoticeTextStyle = TextStyle(
      fontFamily: fontFamily,
      color: Colors.redAccent,
      fontSize: 19 * uiScale,
      fontWeight: FontWeight.w500
  );

  static TextStyle descriptionTextStyle = const TextStyle(
      fontFamily: fontFamily,
      color: MQColor.textColor,
      fontSize: 18 * uiScale,
      fontWeight: FontWeight.normal
  );

  static TextStyle textSetupSubTitleStyle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.primaryColor,
    fontSize: 36 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 22 * uiScale,
    fontWeight: FontWeight.w600,
  );

  static TextStyle infoItemTextStyle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.primaryColor,
    fontSize: 23 * uiScale,
    fontWeight: FontWeight.w800,
  );

  static TextStyle textActionButtonTextStyle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.actionButtonTextColor,
    backgroundColor: MQColor.primaryColor,
    fontSize: 22 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static ButtonStyle textActionButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(MQColor.primaryColor),
  );

  static TextStyle textActionButtonTextTransparentStyle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.primaryColor,
    fontSize: 22 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonAlternativeTextNotLinkStyle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 22 * uiScale,
    fontWeight: FontWeight.w400,
  );

  static TextStyle cardSubtextColor = const TextStyle(
      fontWeight: FontWeight.w600,
      color: MQColor.textColorDisabled,
      fontSize: 12
  );

  static TextStyle formErrorHintTextStyle = const TextStyle(
    color: MQColor.formErrorHint,
  );

  static final TextStyle formFatalErrorHintTextStyle = formErrorHintTextStyle
      .copyWith(color: MQColor.fatalError, fontWeight: FontWeight.bold);

  // paddings ---------------------------------------------

  static const double buttonSplashPadding = 4;

  static const double inputFieldPaddings = 16.0;
  static const double screenPaddingH = 18.0;
  static const double screenPaddingHButton =
      screenPaddingH - buttonSplashPadding;
  static double cardPaddingV = 8.0;

  // ------------------------------------------------------

  // margin -----------------------------------------------
  static double textInputFieldMarginBottom = 14;
  // ------------------------------------------------------

  // Icon view.style -------------------------------------------

  static double signupTitleIconSize = 40 * uiScale;

  // ------------------------------------------------------
  // Card view.style -------------------------------------------

  static BoxShadow cardShadow = BoxShadow(
    blurRadius: 18 * uiScale,
    color: Colors.black.withAlpha(60),
    offset: Offset(8, 8),
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    color: MQColor.bgColorDark,
    boxShadow: [
      MQTheme.cardShadow
    ],
    borderRadius: BorderRadius.circular(16),
  );

  static const BoxDecoration itemCardBoxDecoration = BoxDecoration(
    color: MQColor.bgColorDark,
    borderRadius: BorderRadius.all(MQTheme.radiusElement),
  );

  // ------------------------------------------------------

  static const double breakToggleKeyboard = 650;
  static const double breakToggleSubtitle = 600;
  static const double titleShrinkBreakpoint = 550;

  // ------------------------------------------------------

  // Setup Screens

  static TextStyle setupCardTitleStyle = const TextStyle(
    fontFamily: fontFamily,
    color: MQColor.textColor,
    fontSize: 28 * uiScale,
    fontWeight: FontWeight.bold,
  );

  static final ThemeData _baseTheme = ThemeData(
    brightness: brightness,
    primaryColor: MQColor.primaryColor,
    secondaryHeaderColor: MQColor.secondaryColor,
    primarySwatch: MaterialColor(MQColor.primaryColor.value, {
      50:MQColor.primaryColor.withAlpha((0.1 * 255.0).toInt()),
      100:MQColor.primaryColor.withAlpha((0.2 * 255.0).toInt()),
      200:MQColor.primaryColor.withAlpha((0.3 * 255.0).toInt()),
      300:MQColor.primaryColor.withAlpha((0.4 * 255.0).toInt()),
      400:MQColor.primaryColor.withAlpha((0.5 * 255.0).toInt()),
      500:MQColor.primaryColor.withAlpha((0.6 * 255.0).toInt()),
      600:MQColor.primaryColor.withAlpha((0.7 * 255.0).toInt()),
      700:MQColor.primaryColor.withAlpha((0.8 * 255.0).toInt()),
      800:MQColor.primaryColor.withAlpha((0.9 * 255.0).toInt()),
      900:MQColor.primaryColor.withAlpha((1.0 * 255.0).toInt()),
    }),

    fontFamily: fontFamily,

    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 56.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0),
    ),
  );

  static const _themeColor = Color.fromRGBO(0x3A, 0x88, 0xFF, 1.0);
  static const _secondaryColor = Color.fromRGBO(0x70, 0xA2, 0xFF, 1.0);

  // TODO
  static ThemeData theme = _baseTheme.copyWith()
    .copyWith(
      colorScheme: const ColorScheme.light().copyWith(
        brightness: Brightness.light,
        primary: _themeColor,
        secondary: _secondaryColor,
        surface: Colors.grey[200],
      ),
      cardColor: MQColor.bgColorDark,
      cardTheme: CardTheme(
        color: Colors.white70,
      ),
      textTheme: Typography.blackHelsinki.copyWith(
        bodyText2: TextStyle(
          color: Colors.grey[800],
          fontSize: 14,
        ),
      ),
    );

  // TODO
  static ThemeData darkTheme = _baseTheme
    .copyWith(
      cardColor: MQColor.bgColorDark,
      cardTheme: CardTheme(
        color: MQColor.bgColorDark,
      ),
      textTheme: Typography.whiteHelsinki.copyWith(
        bodyText2: TextStyle(
          color: Colors.grey[200],
          fontSize: 14,
        ),
      ),
    );

  static RoundedRectangleBorder dialogBoxShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(radiusCard),
  );

}
