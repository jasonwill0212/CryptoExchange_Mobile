import 'package:cryptoexchange/components/app_color.dart';
import 'package:flutter/material.dart';

class WidgetBoxDecoration {
  static BoxDecoration boxDecoration(BuildContext context) => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    color: Theme.of(context).colorScheme.surface,
    borderRadius: BorderRadius.circular(12),
  );
}
