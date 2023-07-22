import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/ui/views/main_view/main_view_view_model.dart';
import 'package:test_project/ui/views/main_view/main_view_widget.dart';

class ScreenFactory {
  Widget makeMainScreen() {
    return ChangeNotifierProvider(
      create: (_) => MainScreenViewModel(),
      child: const MainViewWidget(),
    );
  }
}
