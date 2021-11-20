import 'package:flutter/cupertino.dart';
import 'package:munich_data_quiz/constants/text.dart';
import 'package:munich_data_quiz/widgets/title/titles.dart';

class LogoTitle extends StatelessWidget {
  LogoTitle({
    this.scale = 1.0,
    this.customTitle,
    Key? key
  }) : super(key: key);

  double scale;
  String? customTitle;

  @override
  Widget build(BuildContext context) {
    return TitleH1Widget(
      scale: scale,
      title: customTitle ?? MQTexts.appName,
    );
  }
}
