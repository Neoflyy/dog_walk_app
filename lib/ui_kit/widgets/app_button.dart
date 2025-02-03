import 'package:dog_walk_app/ui_kit/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton.filled({
    super.key,
    required this.content,
    required this.onPressed,
    this.isFilled = true,
  });

  const AppButton.outline({
    super.key,
    required this.content,
    required this.onPressed,
    this.isFilled = false,
  });

  final bool isFilled;
  final Widget content;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: isFilled ? 16 : 14),
        ),
        backgroundColor: WidgetStateProperty.all(
          isFilled ? AppColors.onSurface : AppColors.surface,
        ),
        side: WidgetStateProperty.all(const BorderSide(
          color: AppColors.onSurface,
          width: 1.0,
        )),
        shape: WidgetStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        )),
      ),
      child: content,
    );
  }
}
