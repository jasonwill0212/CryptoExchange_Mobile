import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppSegmented extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const AppSegmented({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(343),
      height: context.h(32),
      decoration: BoxDecoration(
        color: AppColor.lightgrayishblue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;
          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(context.w(6)),
              onTap: () => onChanged(index),
              child: Stack(
                children: [
                  /// Selected background
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.all(context.w(2)),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white
                          : AppColor.lightgrayishblue,
                      borderRadius: BorderRadius.circular(context.w(6)),
                    ),
                  ),

                  /// Text (optical center)
                  Center(
                    child: Transform.translate(
                      offset: const Offset(0, -1.5), // FIX BASELINE
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: context.w(14),
                          fontWeight: FontWeight.w400,
                          color: isSelected
                              ? AppColor.darkNavyBlue
                              : AppColor.grayishNavy,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
