import 'package:flutter/material.dart';
import 'package:learnengo/CachedController.dart';
import 'package:learnengo/enums.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'system';

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    CachedController.cache.setData(sharedPrefrencesKeys.theme, theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    currentTheme =
        CachedController.cache.getData(sharedPrefrencesKeys.theme) ?? 'system';
    notifyListeners();
  }
}
