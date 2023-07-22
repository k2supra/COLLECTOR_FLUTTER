import 'package:flutter/material.dart';

/*ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0x121212FF),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 0, 0, 75),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 0, 0, 50),
    selectedIconTheme: IconThemeData(color: Colors.white),
    unselectedIconTheme: IconThemeData(color: Colors.white),
    //selectedLabelStyle: TextStyle(color: Colors.white),
    //unselectedLabelStyle: TextStyle(color: Colors.white),
  ),
  colorScheme: const ColorScheme.dark(
    background: Color(0x121212FF),
    primary: Color.fromARGB(240, 18, 18, 50),
    secondary: Color.fromARGB(255, 0, 0, 75),
    tertiary: Color(0x121212FF),
    inverseSurface: Color.fromARGB(255, 0, 0, 50),
    outline: Colors.white,
    onPrimary: Colors.white,
  ),
);*/


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor:const Color.fromARGB(162, 18, 18, 70),
    iconTheme:const IconThemeData(color: Colors.white),
    titleTextStyle:const TextStyle(color: Colors.white, fontSize: 20),
    elevation: 3,
    shadowColor: Colors.indigo[900]
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromARGB(255, 0, 0, 75),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 0, 0, 75),
    splashColor: Colors.white,
    extendedTextStyle: TextStyle(
      color: Colors.white,
    )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 0, 0, 50),
    selectedIconTheme: IconThemeData(
      color: Colors.white
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey
    )
  ),
  datePickerTheme: const DatePickerThemeData(
    dayStyle: TextStyle(color: Colors.white),
    headerHeadlineStyle: TextStyle(color: Colors.white),
    todayBorder: BorderSide(color: Colors.white),
  ),
  
  colorScheme: ColorScheme.dark(
    background: const Color(0x121212FF),
    onPrimary: Colors.yellow[900]!,
    inversePrimary: Colors.green[900]!,
  )
);