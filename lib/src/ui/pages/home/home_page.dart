import 'package:dog_walk_app/src/ui/widgets/tag_widget.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _labelList = [
      'Price hourly: min \$10',
      'Small dogs',
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.primaryBackground,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Row(
            children: [
              for (final label in _labelList) TagWidget(label: label),
            ],
          )
        ],
      ),
    );
  }
}
