import 'package:dog_walk_app/commons/enums.dart';
import 'package:dog_walk_app/src/ui/pages/pages.dart';
import 'package:dog_walk_app/src/ui/widgets/widgets.dart';
import 'package:dog_walk_app/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  static const path = 'app_view';
  static const name = 'AppView';

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  BottomBarTab currentTab = BottomBarTab.home;

  void _changeTab(BottomBarTab tab) {
    setState(() {
      currentTab = tab;
    });
  }

  final Map<BottomBarTab, Widget> pages = {
    BottomBarTab.home: const HomePage(),
    BottomBarTab.activities: const ActivitiesPage(),
    BottomBarTab.profile: const ProfilePage(),
  };

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasNavBar: true,
      header: const AppHeaderWidget(),
      bottomNavigation: BottomNavigation(
        currentTab: currentTab,
        onPressed: (s) {
          _changeTab(s);
        },
      ),
      body: pages[currentTab]!,
    );
  }
}

class AppHeaderWidget extends StatelessWidget {
  const AppHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.locationIcon),
        const SizedBox(width: 8),
        Text(
          'Kastanienallee, Berlin',
          style: TextStyles.h1.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButtonWrapper(
          onTap: () {},
          icon: Assets.filterIcon,
        ),
      ],
    );
  }
}
