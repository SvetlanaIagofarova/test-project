import 'package:flutter/material.dart';
import 'package:test_project/ui/navigation/main_navigation.dart';
import 'package:test_project/ui/theme/main_theme.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MainTheme().mainTheme,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRoutesNames.mainScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
