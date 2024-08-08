import 'package:flutter/material.dart';
import 'package:news_app/utils/app_const.dart';
//import 'package:news_app/utils/global/theme/appColor/app_color_dart.dart';
import 'package:news_app/utils/global/theme/appColor/app_color_light.dart';

ThemeData getThemDataLight() => ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorlight.brimaryColor,
      scaffoldBackgroundColor: AppColorlight.scaffoldBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorlight.bottomNavBarBackgroundColor,
        elevation: 2,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppConstant.s16,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          size: AppConstant.s20,
          color: AppColorlight.iconColor,
        ),
        elevation: 0,
        backgroundColor: AppColorlight.appBarBackgroundColor,
        titleTextStyle: TextStyle(
          color: AppColorlight.titleTextStyle,
          fontSize: AppConstant.s18,
        ),
      ),
      dividerColor: AppColorlight.dividerColor,
      iconTheme: const IconThemeData(
        size: AppConstant.s16,
        color: AppColorlight.iconColor,
      ),
    );
