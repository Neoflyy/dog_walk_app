import 'package:dog_walk_app/ui_kit/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.hasNavBar = true,
    required this.header,
    this.bottomNavigation,
  });

  final Widget body;
  final bool hasNavBar;
  final Widget header;
  final Widget? bottomNavigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: hasNavBar ? bottomNavigation : null,
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: header,
            ),
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
