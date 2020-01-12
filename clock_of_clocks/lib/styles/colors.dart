// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../extensions/apt_brightness.dart';
import '../state/theme_essentials.dart';

enum PaletteColor {
  primaryColor,
  secondaryColor,
  tertiaryColor,
  labelColor,
  backgroundColor,
  primaryGradientColor,
  secondaryGradientColor,
}

const lightPrimaryColor = Color(0xFF000000);
const lightSecondaryColor = Color(0x20252525);
const lightTertiaryColor = Color(0xFFFE1212);

const lightLabelColor = Color(0x50252525);
const lightBackgroundColor = Color(0xFFFFFFFF);

const lightPrimaryGradientColor = Color(0xFFFFFFFF);
const lightSecondaryGradientColor = Color(0xFF000000);

const darkPrimaryColor = Color(0xFFFFFFFF);
const darkSecondaryColor = Color(0x20DADADA);
const darkTertiaryColor = Color(0xFFFE1212);

const darkLabelColor = Color(0x75DADADA);
const darkBackgroundColor = Color(0xFF000000);

const darkPrimaryGradientColor = Color(0xFF000000);
const darkSecondaryGradientColor = Color(0xFFFFFFFF);

const emptySpaceHandColor = Color(0x507C7C7C);

Color themeBasedColor(
  BuildContext context,
  PaletteColor color, {
  bool listen = true,
}) {
  final Brightness brightness = subscribeToBrigthness(context, listen: listen);
  final isLight = brightness.isLight();

  switch (color) {
    case PaletteColor.primaryColor:
      return isLight ? lightPrimaryColor : darkPrimaryColor;
    case PaletteColor.secondaryColor:
      return isLight ? lightSecondaryColor : darkSecondaryColor;
    case PaletteColor.tertiaryColor:
      return isLight ? lightTertiaryColor : darkTertiaryColor;
    case PaletteColor.labelColor:
      return isLight ? lightLabelColor : darkLabelColor;
    case PaletteColor.backgroundColor:
      return isLight ? lightBackgroundColor : darkBackgroundColor;
    case PaletteColor.primaryGradientColor:
      return isLight ? lightPrimaryGradientColor : darkPrimaryGradientColor;
    case PaletteColor.secondaryGradientColor:
      return isLight ? lightSecondaryGradientColor : darkSecondaryGradientColor;
    default:
      return isLight ? Color(0xFF000000) : Color(0xFFFFFFFF);
  }
}
