import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback ontap;
  final String textButton;
  final TextStyle? style;
  const AppButton({
    super.key,
    required this.ontap,
    required this.textButton,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final screenHeight = screen.height;
    final screenWidth = screen.width;
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Container(
          width: screenWidth - 32,
          height: (48 / 812) * screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.brightBlue,
          ),
          child: Align(
            child: Text(
              textButton,
              style: style ?? AppTextstyle.tsMediumWhite16,
            ),
          ),
        ),
      ),
    );
  }
}
