import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/gradients.dart';
import 'clock_hand.dart';

class AnalogClock extends StatelessWidget {
	final int id;
  final List<ClockHand> clockHands;

  AnalogClock({
		@required this.id,
    @required this.clockHands,
  }) : assert(clockHands != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: themeBasedColor(context, PaletteColor.secondaryColor),
          width: 1, // TODO: Check if this is ideal (compare with 0)
        ),
        gradient: primaryGradient(context),
      ),
      child: Stack(
        children: renderClockHands(context),
      ),
    );
  }

  List<Widget> renderClockHands(BuildContext context) {
    return clockHands.map((item) {
      return renderClockHand(context, item);
    }).toList();
  }

  Widget renderClockHand(BuildContext context, ClockHand clockHand) {
    // print(clockHand.angle);
    return Transform.rotate(
      alignment: Alignment.center,
      angle: clockHand.angle,
      child: Align(alignment: Alignment.centerRight, child: clockHand),
    );
  }
}
