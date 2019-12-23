import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../models/clock_hand_model.dart';
import '../state/clock_state.dart';
import '../styles/colors.dart';
import '../styles/gradients.dart';
import 'clock_hand.dart';

class AnalogClock extends StatefulWidget {
  final int id;

  AnalogClock({
    @required this.id,
  });

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  List<ClockHandModel> clockHandsData = [];
  ClockState clockState;

  @override
  Widget build(BuildContext context) {
    clockState = PropertyChangeProvider.of<ClockState>(
      context,
      listen: true,
      properties: [widget.id],
    ).value;
    clockHandsData = clockState?.analogClockData[widget.id].clockHands;
    print('${widget.id}');

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
    return clockHandsData.map((clockHandData) {
      return renderClockHand(context, clockHandData);
    }).toList();
  }

  Widget renderClockHand(BuildContext context, ClockHandModel clockHandData) {
    return Transform.rotate(
      alignment: Alignment.center,
      angle: clockHandData.angle,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClockHand(
          id: clockHandData.id,
          angle: clockHandData.angle,
          color: clockHandData.color,
        ),
      ),
    );
  }
}
