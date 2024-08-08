import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/utils/global/theme/theme_data/theme_data_dark.dart';
import 'package:news_app/utils/global/theme/theme_data/theme_data_light.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(getThemDataLight()) {
    _getThemePrefs();
  }
  Future<void> _saveThemePrefs(Brightness brightness) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("theme", themeIndex);
    debugPrint("theme saved successfully");
  }

  Future<void> _getThemePrefs() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final savedThemeIndex = sharedPreferences.getInt("theme");
    final savedTheme =
        savedThemeIndex == 0 ? getThemDataLight() : getThemDataDark();
    emit(savedTheme);
    debugPrint("Theme got successfully");
  }

  void toggleTheme() {
    final newTheme = state.brightness == Brightness.light
        ? getThemDataDark()
        : getThemDataLight();
    emit(newTheme);
    _saveThemePrefs(newTheme.brightness);
    debugPrint("Toggeled Successfully");
  }
}
