import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get width => screenSize.width;
  double get height => screenSize.height;
  double get aspectRatio {
    final double itemHeight = (height - kToolbarHeight - 24) / 2;
    final double itemWidth = width / 2;

    double aspectRatio = (itemWidth / itemHeight);

    return aspectRatio;
  }
}
