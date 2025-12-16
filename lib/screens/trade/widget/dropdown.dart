import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class TradeDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T> onChanged;
  final String Function(T) labelBuilder;
  final DropdownType dropdownType;

  const TradeDropdown({
    super.key,
    required this.dropdownType,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      color: AppColor.white,
      onSelected: onChanged,
      itemBuilder: (context) {
        return items
            .map(
              (e) => PopupMenuItem<T>(value: e, child: Text(labelBuilder(e))),
            )
            .toList();
      },
      child: Container(
        height: context.h(28),
        width: context.w(_cardwidth()),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.w(7)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Align(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.translate(
                offset: const Offset(0, -1),
                child: Align(
                  child: Text(
                    labelBuilder(value),
                    style: AppTextStyle.tsRegulardarkNavyBlue14,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, size: 10),
            ],
          ),
        ),
      ),
    );
  }

  _cardwidth() {
    switch (dropdownType) {
      case DropdownType.small:
        return 55.0;
      case DropdownType.medium:
        return 80.0;
      case DropdownType.large:
        return 188.0;
    }
  }
}
