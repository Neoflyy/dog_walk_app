import 'package:dog_walk_app/commons/enums.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.onPressed,
    required this.currentTab,
  });
  final ValueChanged onPressed;
  final BottomBarTab currentTab;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late final Iterable<({String label, String icon, BottomBarTab value})>
      _buttons = [
    (
      label: 'Home',
      icon: Assets.homeIcon,
      value: BottomBarTab.home,
    ),
    (
      label: 'Activities',
      icon: Assets.activitiesIcon,
      value: BottomBarTab.activities
    ),
    (
      label: 'Account',
      icon: Assets.profileIcon,
      value: BottomBarTab.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_buttons.length, (int i) {
          return Expanded(
              child: _NavButton(
            icon: _buttons.elementAt(i).icon,
            label: _buttons.elementAt(i).label,
            onPressed: (value) {
              widget.onPressed(value);
            },
            value: _buttons.elementAt(i).value,
            selectedValue: widget.currentTab,
          ));
        }),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String icon;
  final String label;
  final BottomBarTab value;
  final BottomBarTab selectedValue;
  final ValueChanged<BottomBarTab> onPressed;

  const _NavButton({
    required this.icon,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = value == selectedValue;

    final buttonIcon = Image.asset(
      icon,
      fit: BoxFit.cover,
      color: isActive ? AppColors.onSurface : AppColors.darkerGrey,
    );

    final Text label = Text(
      this.label,
      style: TextStyles.bodySmall.copyWith(
          color: isActive ? AppColors.onSurface : AppColors.darkerGrey,
          fontWeight: FontWeight.normal),
    );

    return SizedBox(
      height: 60,
      width: 60,
      child: MaterialButton(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(4),
        onPressed: () => onPressed(value),
        child: Column(
          children: [
            buttonIcon,
            label,
          ],
        ),
      ),
    );
  }
}
