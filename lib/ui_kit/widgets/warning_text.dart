import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class WarningText extends StatelessWidget {
  const WarningText({super.key, required this.warningText});
  final String warningText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.info_outline,
          color: AppColors.warning,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            warningText,
            softWrap: true,
            overflow: TextOverflow.clip,
            style: TextStyles.bodySmall,
          ),
        )
      ],
    );
  }
}
