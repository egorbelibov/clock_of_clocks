import 'dart:math';

import 'package:flutter/material.dart';

import '../components/analog_clock.dart';
import '../components/clock_hand.dart';
import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';

class ClockMesh extends StatefulWidget {
  @override
  _ClockMeshState createState() => _ClockMeshState();
}

class _ClockMeshState extends State<ClockMesh> {
  List<AnalogClockModel> _analogClocks = [];

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _analogClocks[8] = AnalogClockModel(
          clockHands: [
            ClockHandModel(
              angle: pi,
            ),
            ClockHandModel(
              angle: pi * 2 / 3,
            ),
          ],
        );
        setState(() {
          _analogClocks = _analogClocks;
        });
      },
      child: Center(
        child: Container(
          width: 525,
          height: 280,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 8,
            children: renderClocks(),
          ),
        ),
      ),
    );
  }

  void initializeValues() {
    for (var i = 0; i < 120; i++) {
      _analogClocks.add(
        AnalogClockModel(
          clockHands: [
            ClockHandModel(
              angle: pi,
            ),
            ClockHandModel(
              angle: pi / 2,
            ),
          ],
        ),
      );
    }
  }

  List<Widget> renderClocks() {
    return _analogClocks.map((analogClock) {
      return AnalogClock(
        clockHands: analogClock.clockHands.map((clockHand) {
          return ClockHand(color: clockHand.color, angle: clockHand.angle);
        }).toList(),
      );
    }).toList();
  }
}
