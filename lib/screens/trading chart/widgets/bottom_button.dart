import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            height: context.h(115),
            color: AppColor.almostWhite,
            child: Center(
              child: AppButton(
                iconPath: AppPath.icRecieve,
                contentButtonType: ContentButtonType.prefixIcon,
                textButton: 'SELL',
                buttonType: ButtonType.second,
              ),
            ),
          ),
        ),
        SizedBox(width: context.w(16)),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            height: context.h(115),
            color: AppColor.almostWhite,
            child: Center(
              child: AppButton(
                iconPath: AppPath.icSend,
                contentButtonType: ContentButtonType.suffixIcon,
                textButton: 'BUY',
                buttonType: ButtonType.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
