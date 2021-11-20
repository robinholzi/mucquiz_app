

import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/view/style/screen/base.dart';
import 'package:munich_data_quiz/view/widget/StateDisplay.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          StateDisplay.waiting(),
        ],
      ),
    );
  }
}
