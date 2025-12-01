import 'package:cryptoexchange/components/app_color.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final bool isShawdow;
  final Color? color;
  const AppCard({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.isShawdow = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final screenHeight = screen.height;
    final screenWidth = screen.width;
    return Container(
      width: screenWidth - width,
      height: (height / 969) * screenHeight,
      decoration: BoxDecoration(
        color: color ?? AppColor.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: isShawdow
            ? [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 3),
                  color: Color(0XFF2F66F6).withValues(alpha: 0.12),
                ),
              ]
            : [],
      ),

      child: child,
    );
  }
}
