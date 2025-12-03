import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback ontap;
  final ButtonType buttonType;
  final String? prefixIconPath;
  final String? suffixIconPath;

  final String? textButton;
  final TextStyle? style;
  final Widget? child;
  final Widget? childContent;
  final double? height;
  final double? width;

  const AppButton({
    super.key,
    this.height,
    this.width,
    this.childContent,
    this.child,
    required this.ontap,
    this.textButton,
    this.style,

    this.buttonType = ButtonType.normal,
    this.prefixIconPath,
    this.suffixIconPath,
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
            width: width ?? screenWidth - 32,
            height: height ?? (48 / 812) * screenHeight,
            decoration: BoxDecoration(
              border: buttonType == ButtonType.second
                  ? Border.all(
                      color: AppColor.brightBlue,
                      width: 2,
                      style: BorderStyle.solid,
                    )
                  : null,
              borderRadius: BorderRadius.circular(12),
              color: _buildBackgroundColor(),
            ),
            alignment: Alignment.center,
            child:
                childContent ??
                Text(
                  textButton ?? '',
                  style: style ?? AppTextstyle.tsMediumWhite16,
                ),
          ),
    );
  }

  Color _buildBackgroundColor() {
    switch (buttonType) {
      case ButtonType.normal:
        return AppColor.brightBlue;
      case ButtonType.second:
        return AppColor.white;
      case ButtonType.disable:
        return AppColor.lightgrayishblue;
    }
  }
}
