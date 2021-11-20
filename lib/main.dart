import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/pages/topic_list.dart';
import 'package:munich_data_quiz/root.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: MQColor.systemNavBar,
    systemNavigationBarIconBrightness: MQColor.systemNavBarBrightness,
    statusBarColor: MQColor.bgColorLight,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MunichDataQuizApp());
}

class MunichDataQuizApp extends StatelessWidget {
  const MunichDataQuizApp({Key? key}) : super(key: key);

  static const _themeColor = Color.fromRGBO(0x3A, 0x88, 0xFF, 1.0);
  static const _secondaryColor = Color.fromRGBO(0x70, 0xA2, 0xFF, 1.0);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Munich Data Quiz',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light().copyWith(
          brightness: Brightness.light,
          primary: _themeColor,
          secondary: _secondaryColor,
          surface: Colors.grey[200],
        ),
        textTheme: Typography.blackHelsinki.copyWith(
          bodyText2: TextStyle(
            color: Colors.grey[800],
            fontSize: 14,
          ),
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: const ColorScheme.dark().copyWith(
          brightness: Brightness.dark,
          primary: _themeColor,
          secondary: _secondaryColor,
          surface: Colors.grey[900],
        ),
        textTheme: Typography.whiteHelsinki.copyWith(
          bodyText2: TextStyle(
            color: Colors.grey[200],
            fontSize: 14,
          ),
        ),
      ),
      home: const RootApp(),
    );
  }
}


class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
