

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:munich_data_quiz/view/style/screen/base.dart';
import 'package:munich_data_quiz/widgets/title/titlebar.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseScreenTitled extends StatelessWidget {
  BaseScreenTitled({this.child, Key? key}) : super(key: key);

  Widget? child;

  void launchBrowser() async {
    const url = "https://github.com/nerotyc/mucquiz-app";
    if (await canLaunch(url)) await launch(url);
    else {
      Fluttertoast.showToast(msg: "Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleBarWidget(
              enableButton: true,
              buttonIcon: MdiIcons.share,
              buttonOnClick: launchBrowser,
              subtitle: "Excellence",
              subtitleIcon: MdiIcons.trophyAward,
            ),
            Expanded(
              child: child ?? const SizedBox(),
            ),
          ],
        )
    );
  }
}
