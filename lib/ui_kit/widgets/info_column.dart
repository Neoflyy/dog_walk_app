import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    super.key,
    required this.title,
    required this.widget,
    this.icon,
  });
  final String title;
  final String? icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    Widget content = icon != null
        ? Row(
            children: [
              AppIcon(icon: icon!, color: AppColors.onSurface),
              const SizedBox(width: 10),
              widget
            ],
          )
        : widget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.bold, color: AppColors.greyTextColor),
        ),
        const SizedBox(height: 10),
        content
      ],
    );
  }
}
