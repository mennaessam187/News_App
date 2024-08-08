import 'package:flutter/material.dart';
import 'package:news_app/utils/app_const.dart';
import 'package:news_app/utils/global/theme/appColor/app_color_dart.dart';

ThemeData getThemDataDark() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorDark.brimaryColor,
      scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorDark.bottomNavBarBackgroundColor,
        elevation: 2,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppConstant.s16,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          size: AppConstant.s20,
          color: AppColorDark.iconColor,
        ),
        elevation: 0,
        backgroundColor: AppColorDark.appBarBackgroundColor,
        titleTextStyle: TextStyle(
          color: AppColorDark.titleTextStyle,
          fontSize: AppConstant.s18,
        ),
      ),
      dividerColor: AppColorDark.dividerColor,
      iconTheme: const IconThemeData(
        size: AppConstant.s16,
        color: AppColorDark.iconColor,
      ),
    );
