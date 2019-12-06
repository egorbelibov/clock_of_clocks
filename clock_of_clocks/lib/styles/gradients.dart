import 'package:flutter/widgets.dart';

import 'colors.dart';

Gradient primaryGradient(BuildContext context) {
  return RadialGradient(
    center: const Alignment(0.0, 0.1),
    radius: 1,
    colors: [
      themeBasedColor(context, PaletteColor.primaryGradientColor),
      themeBasedColor(context, PaletteColor.secondaryGradientColor),
    ],
    stops: [0.4, 1.0],
  );
}
