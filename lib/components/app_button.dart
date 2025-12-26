import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// TODO: Implement prefixIconPath and suffixIconPath
class AppButton extends StatelessWidget {
  final GestureTapCallback? ontap;
  final String textButton;
  final ButtonType buttonType;
  final double? width;
  final double? height;
  final ContentButtonType contentButtonType;
  final String? iconPath;

  const AppButton({
    required this.contentButtonType,
    super.key,
    this.ontap,
    required this.textButton,
    required this.buttonType,
    this.width,
    this.height,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height ?? context.screenHeight * 0.06,
        width: width ?? context.screenWidth * 0.9,
        decoration: _buildBoxDecoration(buttonType),
        child: Align(child: _buildContent()),
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

  Widget _buildContent() {
    if (contentButtonType == ContentButtonType.normal || iconPath == null) {
      return AppText(text: textButton, style: _buildTextStyle(buttonType));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (contentButtonType == ContentButtonType.prefixIcon) ...[
          _buildIcon(iconPath!),
          const SizedBox(width: 4),
        ],
        AppText(text: textButton, style: _buildTextStyle(buttonType)),
        if (contentButtonType == ContentButtonType.suffixIcon) ...[
          const SizedBox(width: 4),
          _buildIcon(iconPath!),
        ],
      ],
    );
  }

  Widget _buildIcon(String iconPath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SvgPicture.asset(iconPath, width: 24, height: 24),
    );
  }
}
