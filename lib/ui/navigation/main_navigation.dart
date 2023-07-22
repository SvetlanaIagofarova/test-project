import 'package:flutter/material.dart';
import 'package:test_project/entity/factories/screen_factory.dart';

abstract class MainNavigationRoutesNames {
  static const mainScreen = '/';
}

class MainNavigation {
 static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
  };  
}