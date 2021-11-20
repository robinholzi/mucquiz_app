
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munich_data_quiz/constants/color.dart';
import 'package:munich_data_quiz/constants/theme.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.text = "",
    this.onClick,
    Key? key
  }) : super(key: key);

  String text;
  VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(MQColor.textColor),
          backgroundColor: MaterialStateProperty.all<Color>(MQColor.secondaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(MQTheme.radiusElement),
                  side: BorderSide.none
              )
          )
      ),
    );
  }
}
