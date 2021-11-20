import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/setup.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: MQColor.bgColorLight,
    systemNavigationBarIconBrightness: MQColor.systemNavBarBrightness,
    statusBarColor: MQColor.bgColorLight,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SetupSequence();
  }
}
