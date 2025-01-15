import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/utilitys/themes/text_theme.dart';
import '../constants/color_constants.dart';

// bool isDark = false;

// ThemeMode mode = isDark?ThemeMode.dark:ThemeMode.light;
Rx<ThemeMode> _mode = ThemeMode.dark.obs;

ThemeMode get mode => _mode.value;

toggleTheme() {
  _mode.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: darkScaffold,
  canvasColor: darkCanvas,
  textTheme: darkTextTheme,
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(color: darkRunAppBar),
  colorSchemeSeed: darkIconColor,
  cardColor: darkQuizCard,
  hintColor: darkIconColor,
  cardTheme: const CardTheme(color: darkmauseR),
  listTileTheme: const ListTileThemeData(
    tileColor: darkCanvas,
  ),
);
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: lightScaffold,
  canvasColor: lightCanvas,
  textTheme: lightTextTheme,
  cardColor: lightQuizCard,
  hintColor: lightIconColor,
  iconButtonTheme: const IconButtonThemeData(),
  cardTheme: const CardTheme(color: lightmauseR),
  appBarTheme: const AppBarTheme(color: lightRunAppBar),
  listTileTheme: const ListTileThemeData(
    tileColor: lightCanvas,
  ),
);
