import 'package:cryptoexchange/components/app_color.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;

  const AppCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.boxShadow,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Container(
      width: width ?? screen.width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? AppColor.white,
        borderRadius: borderRadius ?? BorderRadius.circular(14),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 3),
                color: Color(0XFF2F66F6).withValues(alpha: 0.12),
              ),
            ],
      ),
      child: child,
    );
  }
}
