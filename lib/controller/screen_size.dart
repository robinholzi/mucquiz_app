
import 'package:flutter/cupertino.dart';

class ScreenSize extends ChangeNotifier {
  ScreenSize({
    this.minHeight = 0,
    this.maxHeight = double.infinity,
    this.minWidth = 0,
    this.maxWidth = double.infinity
  });

  double minHeight, maxHeight, minWidth, maxWidth;

  void resize({
    double? minHeight,
    double? maxHeight,
    double? minWidth,
    double? maxWidth,
  }) {
    this.minHeight = (minHeight != null) ? minHeight : this.minHeight;
    this.maxHeight = (maxHeight != null) ? maxHeight : this.maxHeight;
    this.minWidth = (minWidth != null) ? minWidth : this.minWidth;
    this.maxWidth = (maxWidth != null) ? maxWidth : this.maxWidth;
  }

}