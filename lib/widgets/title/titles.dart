
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/constants/theme.dart';

class TitleH1Widget extends StatelessWidget {
  TitleH1Widget({
    this.scale = 1.0,
    this.title = "", Key? key
  }) : super(key: key);

  final String title;
  double scale;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: MQTheme.title1.copyWith(
        fontSize: (MQTheme.title1.fontSize ?? 22) * scale
    ));
  }
}

class TitleH2Widget extends StatelessWidget {
  TitleH2Widget({
    this.scale = 1.0,
    this.title = "", Key? key
  }) : super(key: key);

  final String title;
  double scale;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: MQTheme.title2.copyWith(
        fontSize: (MQTheme.title2.fontSize ?? 18) * scale
    ));
  }
}

class TitleH3Widget extends StatelessWidget {
  TitleH3Widget({
    this.scale = 1.0,
    this.title = "", Key? key
  }) : super(key: key);

  final String title;
  double scale;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: MQTheme.title3.copyWith(
        fontSize: (MQTheme.title3.fontSize ?? 16) * scale
    ));
  }
}

class SubTitleWidget extends StatelessWidget {
  SubTitleWidget({
    this.scale = 1.0,
    this.title = "", Key? key
  }) : super(key: key);

  final String title;
  double scale;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: MQTheme.subtitle2.copyWith(
        fontSize: (MQTheme.subtitle2.fontSize ?? 22) * scale
    ));
  }
}
