import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
      {super.key,
      required this.icon,
      this.color = AppColors.surface,
      this.isSvg = false});

  final String icon;
  final bool isSvg;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSvg
        ? SvgPicture.asset(
            icon,
            color: color,
            fit: BoxFit.cover,
          )
        : Image.asset(
            icon,
            color: color,
            fit: BoxFit.cover,
          );
  }
}
