// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../components/clock_hand.dart';
import '../components/clock_label.dart';
import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';
import '../state/clock_state.dart';
import '../styles/colors.dart';
import '../styles/gradients.dart';

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
  List<ClockHandModel> clockHandModels = [];

  @override
  void didChangeDependencies() {
    _updateClockState();
    super.didChangeDependencies();
  }

  void _updateClockState() {
    // Subscribes to changes from [ClockState] & only listens to [widget.id].
    analogClock = PropertyChangeProvider.of<ClockState>(
      context,
      listen: true,
      properties: [widget.id.toString()],
    ).value?.clockMeshModels[widget.id];
    assert(analogClock != null);

    clockHandModels = analogClock.clockHands;
    assert(clockHandModels != null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: themeBasedColor(
            context,
            PaletteColor.secondaryColor,
            listen: false,
          ),
          width: 1,
        ),
        gradient: primaryGradient(context),
      ),
      child: Stack(
        children: [
          analogClock?.label != null
              ? ClockLabel(analogClock.label)
              : Container(),
          ..._buildClockHands(),
        ],
      ),
    );
  }

  List<Widget> _buildClockHands() {
    return clockHandModels.map((hand) {
      assert(hand != null);
      return _buildClockHand(hand);
    }).toList();
  }

  Widget _buildClockHand(ClockHandModel handModel) {
    final angleTween = Tween<double>(begin: 0, end: handModel.angle);
    return TweenAnimationBuilder(
      curve: handModel.animationCurve,
      duration: handModel.animationDuration,
      tween: angleTween,
      child: Align(
        alignment: Alignment.centerRight,
        child: ClockHand(
          id: handModel.id,
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
