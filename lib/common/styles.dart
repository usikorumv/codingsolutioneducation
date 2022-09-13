import 'package:codingsolution/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  return ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(7, 17, 26, 1),
      colorScheme: const ColorScheme.dark(),
      primarySwatch: Colors.yellow,
      primaryColor: const Color(0xFFFFD800),
      iconTheme: IconThemeData(color: Colors.grey[400]),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )));
}

CupertinoThemeData cupthemeData() {
  return const CupertinoThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(7, 17, 26, 1),
    primaryColor: CupertinoDynamicColor.withBrightness(
      color: CupertinoColors.white,
      darkColor: CupertinoColors.black,
    ),
    brightness: Brightness.dark,
    primaryContrastingColor: Colors.yellow,
  );
}

TextStyle logoTextStyle(double mediaQuerySize, Color color) {
  return GoogleFonts.josefinSans(
    fontSize: mediaQuerySize * .025,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
    color: color,
  );
}

TextStyle menuTextStyle(double mediaQuerySize) {
  return TextStyle(
    //color:kPrimaryColor,
    fontSize: mediaQuerySize * .01,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );
}
