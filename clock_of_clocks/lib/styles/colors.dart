import 'package:flutter/material.dart';

enum PaletteColor {
  primaryColor,
  secondaryColor,
  tertiaryColor,
  backgroundColor,
  primaryGradientColor,
  secondaryGradientColor,
}

const lightPrimaryColor = Color(0xFF000000);
const lightSecondaryColor = Color(0x25252525);
const lightTertiaryColor = Color(0xFFFE1212);
const lightBackgroundColor = Color(0xFFFFFFFF);
const lightPrimaryGradientColor = Color(0xFFFFFFFF);
const lightSecondaryGradientColor = Color(0xFF000000);

const darkPrimaryColor = Color(0xFFFFFFFF);
const darkSecondaryColor = Color(0x25252525);
const darkTertiaryColor = Color(0xFFFE1212);
const darkBackgroundColor = Color(0xFF000000);
const darkPrimaryGradientColor = Color(0xFF000000);
final darkSecondaryGradientColor = Color(0xFFFFFFFF);

Color themeBasedColor(BuildContext context, PaletteColor color) {
  final isLightTheme = Theme.of(context).brightness == Brightness.light;
  switch (color) {
    case PaletteColor.primaryColor:
      return isLightTheme ? lightPrimaryColor : darkPrimaryColor;
    case PaletteColor.secondaryColor:
      return isLightTheme ? lightSecondaryColor : darkSecondaryColor;
    case PaletteColor.tertiaryColor:
      return isLightTheme ? lightTertiaryColor : darkTertiaryColor;
    case PaletteColor.backgroundColor:
      return isLightTheme ? lightBackgroundColor : darkBackgroundColor;
    case PaletteColor.primaryGradientColor:
      return isLightTheme
          ? lightPrimaryGradientColor
          : darkPrimaryGradientColor;
    case PaletteColor.secondaryGradientColor:
      return isLightTheme
          ? lightSecondaryGradientColor
          : darkSecondaryGradientColor;
    default:
      return isLightTheme ? Colors.black : Colors.white;
  }
}
