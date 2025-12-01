import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback ontap;
  final String? textButton;
  final TextStyle? style;
  final Widget? child;
  final bool isBorderbox;
  final Color? color;
  const AppButton({
    super.key,
    this.color,
    this.isBorderbox = false,
    this.child,
    required this.ontap,
    this.textButton,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final screenHeight = screen.height;
    final screenWidth = screen.width;
    return InkWell(
      onTap: ontap,
      child:
          child ??
          Container(
            width: screenWidth - 32,
            height: (48 / 812) * screenHeight,
            decoration: isBorderbox
                ? BoxDecoration(
                    border: Border.all(
                      color: color ?? AppColor.brightBlue,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color ?? AppColor.brightBlue,
                  ),
            alignment: Alignment.center,
            child: Text(
              textButton ?? '',
              style: style ?? AppTextstyle.tsMediumWhite16,
            ),
          ),
    );
  }
}
