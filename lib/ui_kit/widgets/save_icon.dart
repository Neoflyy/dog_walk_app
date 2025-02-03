import 'package:dog_walk_app/ui_kit/theme/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SaveIcon extends StatefulWidget {
  const SaveIcon({super.key, required this.isSaved});

  final bool isSaved;

  @override
  State<SaveIcon> createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  late bool _isActive;

  @override
  void initState() {
    _isActive = widget.isSaved;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _isActive = !_isActive;
        setState(() {});
      },
      child: SvgPicture.asset(
        _isActive ? Assets.saveIconFilled : Assets.saveIcon,
        fit: BoxFit.cover,
      ),
    );
  }
}
