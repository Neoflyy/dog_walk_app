import 'package:dog_walk_app/ui_kit/widgets/save_icon.dart';
import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.image,
    required this.content,
    required this.onTap,
    required this.isSaved,
  });
  final Function() onTap;
  final String image;
  final Widget content;
  final bool isSaved;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  final double _defaultCardWidth = 343;
  final double _defaultCardHeight = 200;

  final BorderRadius _radius = const BorderRadius.all(Radius.circular(8));

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
              ClipRRect(
                borderRadius: _radius,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: SaveIcon(
                  isSaved: widget.isSaved,
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
