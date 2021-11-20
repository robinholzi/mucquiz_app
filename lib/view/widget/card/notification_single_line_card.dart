
import 'package:flutter/cupertino.dart';
import 'package:munich_data_quiz/constants/theme.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    this.cardColor,
    this.text = "",
    Key? key,
  }) : super(key: key);

  Color? cardColor, textColor;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(MQTheme.radiusElement),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Center(
            child: Text(text ?? "", style: TextStyle(color: textColor),)
        ),
      ),
    );
  }
}
