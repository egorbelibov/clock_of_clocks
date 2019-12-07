import 'package:clock_of_clocks/models/clock_hand_model.dart';
import 'package:clock_of_clocks/state/clock_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var clockState = Provider.of<ClockState>(context, listen: true);
		print('${widget.id}: here');
    clockHandsData = clockState?.analogClockData[widget.id].clockHands;
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
    // print(clockHand.angle);
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
