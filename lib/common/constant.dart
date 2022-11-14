import 'package:flutter/material.dart';

const Color kMainColor = Color(0xFF2b2b2b);
const Color kSecondaryColor = Color(0xFF545454);
const Color kYellowColor = Color(0xFFF0B90B);
const Color kBgColor = Color(0xFF242424);
const Color kThirdColor = Color(0xFF404040);

const kColorScheme = ColorScheme(
  primary: kYellowColor,
  primaryContainer: kMainColor,
  secondary: kYellowColor,
  secondaryContainer: kYellowColor,
  surface: kBgColor,
  background: kBgColor,
  error: Colors.red,
  onPrimary: kMainColor,
  onSecondary: kYellowColor,
  onSurface: kYellowColor,
  onBackground: kYellowColor,
  onError: Colors.red,
  brightness: Brightness.dark,
);
