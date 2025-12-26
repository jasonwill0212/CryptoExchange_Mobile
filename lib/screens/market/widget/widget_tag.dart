import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/provider/market_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetTag extends StatelessWidget {
  final List<String> tags;
  final ValueChanged<int> onChanged;
  const WidgetTag({super.key, required this.tags, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<MarketProvider>().selectedIndex;

    return SizedBox(
      height: context.h(28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tags.length, (index) {
          final isSelected = index == selectedIndex;
          return InkWell(
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: context.w(74),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : AppColor.lightgrayishblue,
                ),
              ),
              child: Center(
                child: AppText(
                  text: tags[index],
                  style: isSelected
                      ? AppTextStyle.tsRegularWhite14
                      : AppTextStyle.tsRegulargrayishNavy14.copyWith(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
