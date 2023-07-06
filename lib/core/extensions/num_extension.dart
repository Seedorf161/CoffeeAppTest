import 'package:flutter/material.dart';

extension NumSizedBoxExtension on num {
  Widget get sw => SizedBox(width: toDouble());
  Widget get sh => SizedBox(height: toDouble());
}
