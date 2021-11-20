

import 'package:flutter/cupertino.dart';
import 'package:munich_data_quiz/view/style/screen/base.dart';

class BaseScreenTitled extends StatelessWidget {
  BaseScreenTitled({this.child, this.titleBar, Key? key}) : super(key: key);

  Widget? child, titleBar;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            titleBar ?? const SizedBox(),
            Expanded(
              child: child ?? const SizedBox(),
            ),
          ],
        )
    );
  }
}
