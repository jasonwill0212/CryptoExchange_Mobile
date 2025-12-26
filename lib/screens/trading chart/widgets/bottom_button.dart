import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = (context.screenWidth - 64) / 2;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border(
            top: BorderSide(color: AppColor.lightgrayishblue, width: 1),
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            AppButton(
              width: buttonWidth,
              iconPath: AppPath.icRecieve,
              contentButtonType: ContentButtonType.prefixIcon,
              textButton: 'SELL',
              buttonType: ButtonType.second,
            ),
            SizedBox(width: 32),
            AppButton(
              width: buttonWidth,
              iconPath: AppPath.icSend,
              contentButtonType: ContentButtonType.suffixIcon,
              textButton: 'BUY',
              buttonType: ButtonType.normal,
            ),
          ],
        ),
      ),
    );
  }
}
