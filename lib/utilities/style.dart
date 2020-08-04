import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//COLORS
const mainBackgroundColor = Color(0xFFF3F3F3);
const themeGreen = Color(0xFF146984);
const themeGreenLight = Color(0xFFDDE5E8);
const themeBlue = Color(0xFF0C90DA);
const themeBlueLight = Color(0xFFB9D4E3);
const themeGrey = Color(0xFFB4B4B4);
const themeWhite = Color(0xFFEEEEEE);
const themeBlack = Color(0xFF333333);

const textBlackColor = Color(0xFF333333);
const textWhiteColor = Color(0xFFEEEEEE);
const textGreyColor = Color(0xFF828282);

//TEXT STYLES
//Headings
final pageHeaderTextStyle = GoogleFonts.lato(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: themeGreen,
);

final heading1 = GoogleFonts.lato(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: textBlackColor,
);

final heading2 = GoogleFonts.lato(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: textGreyColor,
);

final smallHeading = GoogleFonts.lato(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: textBlackColor,
  letterSpacing: 1.2,
);

//Input Fields
final fieldLabelTextStyle = GoogleFonts.lato(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: themeGreen,
);

final fieldHintTextStyle = GoogleFonts.lato(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: textGreyColor,
);

//body texts
final body1 = GoogleFonts.lato(
  fontSize: 16,
  height: 1.1,
  fontWeight: FontWeight.w400,
  color: textBlackColor,
);

final body1Grey = body1.copyWith(color: textGreyColor);
final body1Green = body1.copyWith(color: themeGreen);

final body2 = GoogleFonts.lato(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: textBlackColor,
);

final body2Grey = body2.copyWith(color: textGreyColor);
final body2Green = body2.copyWith(color: themeGreen);
final body2Bold = body2.copyWith(fontWeight: FontWeight.w700);
final body2Light = body2.copyWith(fontWeight: FontWeight.w100);

final body3 = GoogleFonts.lato(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: textBlackColor,
);
final body3Light = body3.copyWith(fontWeight: FontWeight.w300, fontSize: 10);
final body3Bold = body3.copyWith(fontWeight: FontWeight.w700);

//button styles
final bigButtonTextStyle = GoogleFonts.lato(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: textWhiteColor,
);

final smallButtonTextStyle = GoogleFonts.lato(
  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: textWhiteColor,
);

class OhwExamAppIcons {
  OhwExamAppIcons._();

  static const _kFontFam = 'OhwExamAppIcons';
  static const _kFontPkg = null;

  static const IconData ohwExamAppIcon = IconData(
    0xe800,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );
}
