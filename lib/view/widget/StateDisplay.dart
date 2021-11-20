import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:munich_data_quiz/constants/color.dart';

class StateDisplay extends StatelessWidget {
  StateDisplay._general({this.child});

  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }

  static Widget sizeWrapper({Widget? child}) {
    return SizedBox(
      width: 65,
      height: 65,
      child: child,
    );
  }

  static StateDisplay icon({
    IconData icon = Icons.info,
    Color iconColor = Colors.blueAccent,
    String? title,
    String? description}) {
    Widget info = SizedBox();
    if (title != null || description != null) {
      if (title == null) title = "";
      if (description == null) description = "";
      info = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(
                color: MQColor.textColor,
                fontSize: 32
            ),),
            const SizedBox(height: 16,),
            Text(description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: MQColor.textColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
    }

    return StateDisplay._general(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          sizeWrapper(
            child: Icon(
              icon,
              color: iconColor,
              size: 65,
            ),
          ),
          const SizedBox(height: 24,),
          info
        ],
      ),
    );
  }

  static StateDisplay error({String? title, String? description}) {
    return StateDisplay.icon(
      icon: Icons.error,
      iconColor: Colors.redAccent,
      title: title,
      description: description,
    );
  }

  static StateDisplay info({String? title, String? description}) {
    return StateDisplay.icon(
      icon: Icons.info,
      iconColor: Colors.lightBlueAccent,
      title: title,
      description: description,
    );
  }

  static StateDisplay success({String? title, String? description}) {
    return StateDisplay.icon(
      icon: MdiIcons.checkCircle,
      iconColor: Colors.greenAccent,
      title: title,
      description: description,
    );
  }

  static StateDisplay waiting() {
    return StateDisplay._general(child: const CircularProgressIndicator());
  }
}
