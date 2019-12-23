import 'package:flutter/material.dart';

enum PaletteColor {
  primaryColor,
  secondaryColor,
  backgroundColor,
  primaryGradientColor,
  secondaryGradientColor,
}

final lightPrimaryColor = Color(0xFF000000);
final lightSecondaryColor = Color(0x25252525);
final lightBackgroundColor = Color(0xFFFFFFFF);
final lightPrimaryGradientColor = Color(0xFFFFFFFF);
final lightSecondaryGradientColor = Color(0xFF000000);

final darkPrimaryColor = Color(0xFFFFFFFF);
final darkSecondaryColor = Color(0x25252525);
final darkBackgroundColor = Color(0xFF000000);
final darkPrimaryGradientColor = Color(0xFF000000);
final darkSecondaryGradientColor = Color(0xFFFFFFFF);

Color themeBasedColor(BuildContext context, PaletteColor color) {
  final isLightTheme = Theme.of(context).brightness == Brightness.light;
  switch (color) {
    case PaletteColor.primaryColor:
      return isLightTheme ? lightPrimaryColor : darkPrimaryColor;
      break;
    case PaletteColor.secondaryColor:
      return isLightTheme ? lightSecondaryColor : darkSecondaryColor;
      break;
    case PaletteColor.backgroundColor:
      return isLightTheme ? lightBackgroundColor : darkBackgroundColor;
      break;
    case PaletteColor.primaryGradientColor:
      return isLightTheme
          ? lightPrimaryGradientColor
          : darkPrimaryGradientColor;
      break;
    case PaletteColor.secondaryGradientColor:
      return isLightTheme
          ? lightSecondaryGradientColor
          : darkSecondaryGradientColor;
      break;
    default:
      return isLightTheme ? Colors.black : Colors.white;
  }
}
