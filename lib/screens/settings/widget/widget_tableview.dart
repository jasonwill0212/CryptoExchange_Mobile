import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WidgetTableview extends StatelessWidget {
  final String text;
  final TableViewType tableViewType;
  final String appPath;

  const WidgetTableview({
    super.key,
    required this.text,
    required this.appPath,
    this.tableViewType = TableViewType.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.h(56),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          SvgPicture.asset(appPath),
          const SizedBox(width: 8),
          AppText(text: text, style: AppTextStyle.tsRegulardarkNavyBlue16),
          const Spacer(),
          _buildTrailing(context),
        ],
      ),
    );
  }

  //trailing widget
  Widget _buildTrailing(BuildContext context) {
    switch (tableViewType) {
      case TableViewType.withSwitch:
        return Row(
          children: [
            AppText(
              text: 'Dark Mode',
              style: AppTextStyle.tsRegulargrayishNavy14,
            ),
            const SizedBox(width: 8),
            Switch(
              value: context.watch<ThemeProvider>().isDark,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme(value);
              },
              activeThumbColor: AppColor.lightPastelGreen,
              activeTrackColor: AppColor.lightgrayishblue,
              inactiveThumbColor: AppColor.white,
              inactiveTrackColor: AppColor.lightgrayishblue,
            ),
          ],
        );

      case TableViewType.normal:
        return const Icon(Icons.chevron_right, color: AppColor.grayishNavy);
    }
  }
}
