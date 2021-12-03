import 'package:flutter/material.dart';
import 'package:shop_app/core/constants.dart';

///? headline4    34.0  regular  0.25
///? headline5    24.0  regular  0.0
///? headline6    20.0  medium   0.15
///? bodyText1    16.0  regular  0.5
///? bodyText2    14.0  regular  0.25
///? button       14.0  medium   1.25
///? caption      12.0  regular  0.4
///? overline     10.0  regular  1.5

ThemeData lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    foregroundColor: kOnPrimaryColor
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kSecondaryColor,
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      color: kGreyColor,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      color: kGreyColor,
    ),
    button: TextStyle(
      fontWeight: FontWeight.w500,
      color: kGreyColor,
    ),
    
  ),
);

ThemeData darkTheme = ThemeData(
    primaryColor: kPrimaryColor,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      elevation: 0,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kSecondaryColor,
    ),
    textTheme: const TextTheme(
      headline4: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w400,
        color: kLightGreyColor,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
        color: kLightGreyColor,
      ),
      button: TextStyle(
        fontWeight: FontWeight.w500,
        color: kLightGreyColor,
      ),
    ));
