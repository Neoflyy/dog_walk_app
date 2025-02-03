import 'package:dog_walk_app/ui_kit/widgets/save_icon.dart';
import 'package:flutter/material.dart';

import '../theme/assets.dart';
import 'app_icon.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({super.key, required this.isSaved});

  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const AppIcon(
              icon: Assets.arrowBack,
              isSvg: true,
            ),
          ),
          const Spacer(),
          SaveIcon(isSaved: isSaved),
        ],
      ),
    );
  }
}
