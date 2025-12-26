import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/core/extension/context_extension.dart';
import 'package:cryptoexchange/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SettingCardItem {
  final String prefixIconPath;
  final String title;
  final bool hasSwitch;

  SettingCardItem({
    required this.prefixIconPath,
    required this.title,
    this.hasSwitch = false,
  });
}

class SettingCardWidget extends StatelessWidget {
  final List<SettingCardItem> items;
  const SettingCardWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(item.prefixIconPath),
                const SizedBox(width: 8),
                Text(item.title, style: context.textTheme.labelSmall),
                const Spacer(),
                item.hasSwitch
                    ? Switch(
                        value: context.watch<ThemeProvider>().isDark,
                        // value: true,
                        onChanged: (value) {
                          context.read<ThemeProvider>().toggleTheme(value);
                        },
                        activeThumbColor: AppColor.lightPastelGreen,
                        activeTrackColor: AppColor.lightgrayishblue,
                        inactiveThumbColor: AppColor.white,
                        inactiveTrackColor: AppColor.lightgrayishblue,
                      )
                    : const Icon(
                        Icons.chevron_right,
                        color: AppColor.grayishNavy,
                      ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Divider(color: AppColor.lightgrayishblue, height: 1),
        ),
      ),
    );
  }
}

// class WidgetTableview extends StatelessWidget {
//   final String text;
//   final TableViewType tableViewType;
//   final String appPath;

//   const WidgetTableview({
//     super.key,
//     required this.text,
//     required this.appPath,
//     this.tableViewType = TableViewType.normal,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: context.h(56),
//       decoration: BoxDecoration(
//         color: AppColor.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 14),
//       child: Row(
//         children: [
//           SvgPicture.asset(appPath),
//           const SizedBox(width: 8),
//           AppText(text: text, style: AppTextStyle.tsRegulardarkNavyBlue16),
//           const Spacer(),
//           _buildTrailing(context),
//         ],
//       ),
//     );
//   }

//   //trailing widget
//   Widget _buildTrailing(BuildContext context) {
//     switch (tableViewType) {
//       case TableViewType.withSwitch:
//         return Row(
//           children: [
//             AppText(
//               text: 'Dark Mode',
//               style: AppTextStyle.tsRegulargrayishNavy14,
//             ),
//             const SizedBox(width: 8),
//             Switch(
//               value: context.watch<ThemeProvider>().isDark,
//               onChanged: (value) {
//                 context.read<ThemeProvider>().toggleTheme(value);
//               },
//               activeThumbColor: AppColor.lightPastelGreen,
//               activeTrackColor: AppColor.lightgrayishblue,
//               inactiveThumbColor: AppColor.white,
//               inactiveTrackColor: AppColor.lightgrayishblue,
//             ),
//           ],
//         );

//       case TableViewType.normal:
//         return const Icon(Icons.chevron_right, color: AppColor.grayishNavy);
//     }
//   }
// }
