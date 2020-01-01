import 'package:clock_of_clocks/helpers/cardinal_directions.dart';
import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../models/analog_clock_model.dart';
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
  AnalogClockModel analogClock;
  List<ClockHandModel> clockHands = [];

  @override
  Widget build(BuildContext context) {
    print('${widget.id}');
    _updateClockState();
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
        children: _renderClockHands(context),
      ),
    );
  }

  void _updateClockState() {
    // Subscribes to changes from [ClockState] & only listens to [widget.id].
    analogClock = PropertyChangeProvider.of<ClockState>(
      context,
      listen: true,
      properties: [widget.id.toString()],
    ).value?.analogClockModels[widget.id];
    assert(analogClock != null);

    clockHands = analogClock?.clockHands;
    assert(clockHands != null);
  }

  List<Widget> _renderClockHands(BuildContext context) {
    return clockHands.map((hand) {
      assert(hand != null);
      return _renderClockHand(context, hand);
    }).toList();
  }

  Widget _renderClockHand(BuildContext context, ClockHandModel handModel) {
    final angleTween = Tween<double>(begin: 0, end: handModel.angle);
    return TweenAnimationBuilder(
      curve: handModel.animationCurve,
      duration: handModel.animationDuration,
      tween: angleTween,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClockHand(
          id: handModel.id,
          angle: handModel.angle,
          color: handModel.color,
        ),
      ),
      builder: (_, angle, child) {
        return Transform.rotate(
          alignment: Alignment.center,
          angle: angle,
          child: child,
        );
      },
    );
  }
}
