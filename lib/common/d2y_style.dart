import 'package:d2ystore/common/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class D2YStyle {
  static const hintStyle = TextStyle(fontSize: 12, fontStyle: FontStyle.italic);

  static const MaterialColor buttonTextColor = MaterialColor(
    0xff2B225B,
    <int, Color>{
      50: Pallete.primary,
      100: Pallete.primary,
      200: Pallete.primary,
      300: Pallete.primary,
      400: Pallete.primary,
      500: Pallete.primary,
      600: Pallete.primary,
      700: Pallete.primary,
      800: Pallete.primary,
      900: Pallete.primary,
    },
  );

  static const textLightTheme = TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
    subtitle2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
    caption: TextStyle(color: Colors.white),
    overline: TextStyle(color: Colors.white),
  );

  var lightTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.blue,
    ),
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Pallete.primary,
    backgroundColor: const Color(0xFF0F0E2A),
    errorColor: Pallete.error,
    indicatorColor: Pallete.primary,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      // textTheme: TextTheme(
      //     headline6: TextStyle(
      //   color: Pallete.primary,
      //   fontSize: 12,
      // )),
      elevation: 0.0,
      color: Pallete.primary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Pallete.primary, // Status bar
      ),
      //brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Pallete.primary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Pallete.primary),
      ),
      suffixIconColor: Pallete.primary,
    ),
    textTheme: textLightTheme,
    primaryTextTheme: textLightTheme,
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
    ),
  );
}
