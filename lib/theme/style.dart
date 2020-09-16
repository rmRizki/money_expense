import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLOR
const primaryColor = Color(0xFF46B5A7);
const accentColor = Color(0xFFF54291);
const iconColor = Color(0xFF0A97B0);
const secondIconColor = Color(0xFFFFFFFF);
const mainBgColor = Color(0xFFF2F2F2);

const darkGrayColor = Color(0xFF4F4F4F);
const grayColor = Color(0xFF828282);
const lightGrayColor = Color(0xFFBDBDBD);
const whiteColor = Color(0xFFFFFFFF);

// TEXTTHEME
const fontFamily = 'Open Sans';

const buttonTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);

const headline5TextStyle = TextStyle(
  color: whiteColor,
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const headline6TextStyle = TextStyle(
  color: darkGrayColor,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

const subtitle1TextStyle = TextStyle(
  color: darkGrayColor,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);

const subtitle2TextStyle = TextStyle(
  color: darkGrayColor,
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
);

// THEMEDATA
ThemeData appTheme(context) {
  final textTheme = Theme.of(context).textTheme;

  return ThemeData(
    textTheme: GoogleFonts.getTextTheme(fontFamily, textTheme).copyWith(
      button: buttonTextStyle,
      headline5: headline5TextStyle,
      headline6: headline6TextStyle,
      subtitle1: subtitle1TextStyle,
      subtitle2: subtitle2TextStyle,
    ),
    scaffoldBackgroundColor: mainBgColor,
    primaryColor: primaryColor,
    accentColor: accentColor,
  );
}
