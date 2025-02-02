import 'package:dog_walk_app/src/ui/app_view.dart';
import 'package:flutter/material.dart';

import 'ui/pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      routes: {
        RequestPage.path: (context) => const RequestPage(),
        DetailPage.path: (context) => const DetailPage(),
        AppView.path: (context) => const AppView(),
      },
      initialRoute: AppView.path,
    );
  }
}
