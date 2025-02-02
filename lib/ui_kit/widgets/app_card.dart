import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.image,
    required this.content,
    required this.onTap,
  });
  final Function() onTap;
  final String image;
  final Widget content;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  double _defaultCardWidth = 343;
  double _defaultCardHeight = 200;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onTap,
        child: SizedBox(
          width: _defaultCardWidth,
          height: _defaultCardHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    isActive = !isActive;
                    setState(() {});
                  },
                  child: SvgPicture.asset(
                    isActive ? Assets.saveIconFilled : Assets.saveIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: widget.content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
