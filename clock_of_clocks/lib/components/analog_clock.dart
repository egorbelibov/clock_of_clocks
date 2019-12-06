import 'dart:math';

import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/gradients.dart';
import 'clock_hand.dart';

class AnalogClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color(context, PaletteColor.secondaryColor),
          width: 1, // TODO: Check if this is ideal (compare with 0)
        ),
        gradient: primaryGradient(context),
      ),
      child: Stack(
        children: [
          renderClockHand(pi * 2),
          renderClockHand(pi),
        ],
      ),
    );
  }

  Widget renderClockHand(double radAngle) {
    return Transform.rotate(
      alignment: Alignment.center,
      angle: radAngle,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClockHand(),
      ),
    );
  }
}
