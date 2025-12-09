import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSocial extends StatelessWidget {
  final double? height;
  final double? width;
  final SocialType type;
  final VoidCallback? onTap;
  const AppSocial({
    super.key,
    required this.type,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? size.height * 0.06,
        width: width ?? size.width * 0.9,
        decoration: _boxDecoration(),
        child: _buildChild(type),
      ),
    );
  }
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    color: AppColor.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColor.lightgrayishblue, width: 1),
  );
}

Row _buildChild(SocialType type) {
  switch (type) {
    case SocialType.google:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppPath.icGoogle),
          SizedBox(width: 8),
          AppText(
            text: 'Continue with Google',
            style: AppTextstyle.tsRegulargrayishNavy14,
          ),
        ],
      );
    case SocialType.facebook:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppPath.icFacebook),
          SizedBox(width: 8),
          AppText(
            text: 'Continue with Facebook',
            style: AppTextstyle.tsRegulargrayishNavy14,
          ),
        ],
      );
    case SocialType.apple:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppPath.icApple),
          SizedBox(width: 8),
          AppText(
            text: 'Continue with Apple',
            style: AppTextstyle.tsRegulargrayishNavy14,
          ),
        ],
      );
  }
}
