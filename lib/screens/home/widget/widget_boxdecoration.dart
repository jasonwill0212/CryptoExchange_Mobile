import 'package:cryptoexchange/components/app_color.dart';
import 'package:flutter/material.dart';

class WidgetBoxDecoration {
  static BoxDecoration boxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColor.brightBlue.withValues(alpha: 0.12),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );
}
