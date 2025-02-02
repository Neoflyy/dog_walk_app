import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      fit: BoxFit.cover,
    );
  }
}
