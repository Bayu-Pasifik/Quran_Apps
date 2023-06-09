import 'package:flutter/material.dart';

const appNormalPurple = Color(0XFF863ED5);
const appDarkPurple = Color(0XFF3B1E77);
const appLightPurple = Color(0XFF994EF8);
const appWhite = Color(0XFFFAF8FC);
const appGrey = Color(0XFFB9A2D8);
const appOrange = Color(0XFFE6704A);

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: appNormalPurple,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(backgroundColor: appNormalPurple),
  textTheme: TextTheme(
      bodyText1: TextStyle(color: appDarkPurple),
      bodyText2: TextStyle(color: appDarkPurple)),
  listTileTheme: ListTileThemeData(textColor: appDarkPurple),
  tabBarTheme: TabBarTheme(
      labelColor: appDarkPurple,
      unselectedLabelColor: appGrey,
      indicator: BoxDecoration(
          border: Border(bottom: BorderSide(color: appDarkPurple, width: 2)))),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appNormalPurple,
  ),
);

ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: appLightPurple,
  scaffoldBackgroundColor: appDarkPurple,
  appBarTheme: AppBarTheme(backgroundColor: appNormalPurple),
  textTheme: TextTheme(
      bodyText1: TextStyle(color: appWhite),
      bodyText2: TextStyle(color: appWhite)),
  listTileTheme: ListTileThemeData(textColor: appWhite),
  tabBarTheme: TabBarTheme(
      labelColor: appWhite,
      unselectedLabelColor: appGrey,
      indicator: BoxDecoration(
          border: Border(bottom: BorderSide(color: appWhite, width: 2)))),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appWhite,
  ),
);
