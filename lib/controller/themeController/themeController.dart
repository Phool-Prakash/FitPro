import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }
  bool _darkTheme = false;
  Color? _lightColor;
  Color? _darkColor;

  bool get darkTheme => _darkTheme;
  Color? get darkColor => _darkColor;
  Color? get lightColor => _lightColor;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool('FitProTheme', _darkTheme);
  }

  void changeTheme(Color lightColor, Color darkColor) {
    _lightColor = lightColor;
    _darkColor = _darkColor;
    update();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool('FitProTheme') ?? false;
    update();
  }
}
