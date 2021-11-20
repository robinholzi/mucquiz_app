
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:munich_data_quiz/constants/color.dart';

class ColoredIconButton extends StatelessWidget {
  ColoredIconButton({
    this.icon = MdiIcons.reload,
    this.onClick,
    this.backgroundColor = MQColor.primaryColor,
    this.color = MQColor.textColor,
    this.tooltip,
    this.radius = 22,
    Key? key
  }) : super(key: key);

  IconData icon;
  VoidCallback? onClick;
  Color color, backgroundColor;
  double radius;
  String? tooltip;

  @override
  Widget build(BuildContext context) {
    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: IconButton(
        splashRadius: (radius / 22.0) * 28,
        icon: Icon(icon, color: color, size: radius,),
        onPressed: onClick ?? (){},
      ),
    );

    if (tooltip == null) return avatar;
    else {
      return Tooltip(
        message: tooltip!,
        child: avatar,
      );
    }
  }
}
