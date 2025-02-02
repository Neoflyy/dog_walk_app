import 'package:dog_walk_app/ui_kit/theme/app_colors.dart';
import 'package:dog_walk_app/ui_kit/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatefulWidget {
  const TagWidget({
    super.key,
    required this.label,
  });
  final String label;

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  bool _isVisible = true;

  void _removeTag() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Chip(
        side: BorderSide.none,
        color: const WidgetStatePropertyAll(AppColors.primaryGrey),
        label: Text(
          widget.label,
          style: TextStyles.caption.copyWith(fontWeight: FontWeight.bold),
        ),
        deleteIcon: const Icon(Icons.close),
        onDeleted: _removeTag,
      ),
    );
  }
}
