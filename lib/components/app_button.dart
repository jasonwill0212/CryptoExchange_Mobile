import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback? ontap;
  final String textButton;
  final ButtonType buttonType;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    this.ontap,
    required this.textButton,
    required this.buttonType,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height ?? size.height * 0.06,
        width: width ?? size.width * 0.9,
        decoration: _buildBoxDecoration(buttonType),
        child: Align(
          child: AppText(text: textButton, style: _buildTextStyle(buttonType)),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.disable:
        return BoxDecoration(
          color: Color(0XFFD7D9E4),
          borderRadius: BorderRadius.circular(12),
        );
      case ButtonType.second:
        return BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.brightBlue, width: 2),
          borderRadius: BorderRadius.circular(12),
        );
      default:
        return BoxDecoration(
          color: AppColor.brightBlue,
          borderRadius: BorderRadius.circular(12),
        );
    }
  }

  TextStyle _buildTextStyle(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.disable:
        return AppTextStyle.tsMediumWhite16;
      case ButtonType.second:
        return AppTextStyle.tsMediumbrightBlue16;
      default:
        return AppTextStyle.tsMediumWhite16;
    }
  }
}
