import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    elevation: 3,
    shadowColor: Colors.grey
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.indigo[600],
    splashColor: Colors.white,
    extendedTextStyle: const TextStyle(
      color: Colors.white,
    )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: Colors.black
    )
  ),
  datePickerTheme: const DatePickerThemeData(
    dayStyle: TextStyle(color: Colors.black),
    headerHeadlineStyle: TextStyle(color: Colors.black),
    todayBorder: BorderSide(color: Colors.black),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    onPrimary: Colors.yellow[700]!,
    inversePrimary: Colors.green,
    secondary: Colors.white,
  )
);