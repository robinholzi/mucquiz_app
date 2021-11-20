
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/constants/theme.dart';
import 'package:munich_data_quiz/view/widget/button/rounded_button.dart';

class PopupDialogWidget extends StatefulWidget {
  PopupDialogWidget({
    this.title = "",
    this.child = const SizedBox(),
    Key? key}) : super(key: key);

  String title;
  Widget child;

  @override
  _PopupDialogWidgetState createState() => _PopupDialogWidgetState();

  static Future<dynamic> show(BuildContext context,
      String title, Widget child) async {
    return showDialog(
      context: context,
      builder: (_) {
        return PopupDialogWidget(
          title: title,
          child: child,
        );
      },
    );
  }


}

class _PopupDialogWidgetState extends State<PopupDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: MQTheme.dialogBoxShape,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: MQColor.bgColorLight,
          borderRadius: BorderRadius.all(MQTheme.radiusCard),
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0,10),
                blurRadius: 10
            ),
          ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MQTheme.popupCardVerticalPadding
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.title,style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
            SizedBox(height: 24,),
            widget.child
          ],
        ),
      ),
    );
  }
}

class NotificationDialogWidget {

  static Future<void> show(BuildContext context, String title,
      String description, {Color textColor = MQColor.textColor}) async {
    return PopupDialogWidget.show(context, title, Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(description,
            textAlign: TextAlign.center,
            style: MQTheme.formFatalErrorHintTextStyle.copyWith(
                color: textColor
            ),
          ),
        ),
        const SizedBox(height: 18,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              text: AppLocalizations.of(context)!.okayGotIt,
              onClick: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    ));
  }

}
