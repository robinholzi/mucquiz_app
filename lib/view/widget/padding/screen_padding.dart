
import 'package:flutter/cupertino.dart';
import 'package:munich_data_quiz/constants/theme.dart';

class ScreenPadding extends StatelessWidget {
  ScreenPadding({
    Widget child = const SizedBox(), this.children,
    Key? key
  }) : super(key: key) {
    if (children == null) children = [child];
  }

  List<Widget>? children = const [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MQTheme.screenPaddingH),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children ?? [],
      ),
    );
  }
}

class ScreenPaddingButton extends StatelessWidget {
  ScreenPaddingButton({
    Widget child = const SizedBox(), this.children,
    Key? key
  }) : super(key: key) {
    if (children == null) children = [child];
  }

  List<Widget>? children = const [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MQTheme.screenPaddingHButton),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children ?? [],
      ),
    );
  }
}
