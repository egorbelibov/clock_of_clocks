import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/analog_clock.dart';
import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';
import '../state/clock_state.dart';

/// An 8x15 Mesh / Grid of Analog Clocks
///
/// This Mesh has a fixed size of [containerWidth] x [containerHeight]
/// so as to fit the target device (*Lenovo Smart Clock*). Although it's
/// fixed, it is possible to change it with the [MediaQuery] helpers.
/// Changing the size of this mesh will automatically resize its children.
class ClockMesh extends StatefulWidget {
  @override
  _ClockMeshState createState() => _ClockMeshState();
}

class _ClockMeshState extends State<ClockMesh> {
  final double _containerWidth = 525;
  final double _containerHeight = 280;
  List<AnalogClockModel> _analogClockData = [];

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  void initializeValues() {
    var clockState = Provider.of<ClockState>(context, listen: false);
    _analogClockData = clockState?.analogClockData;
  }

  @override
  Widget build(BuildContext context) {
    print('ClockMesh');
    return Center(
      child: Container(
        width: _containerWidth,
        height: _containerHeight,
        child: renderGridView(),
      ),
    );
  }

  Widget renderGridView() {
    return GestureDetector(
      onTap: () {
        Provider.of<ClockState>(context).updateSingleClock(
          id: 0,
          clockHands: [
            ClockHandModel(
              id: 0,
              angle: 2 * pi,
              color: Colors.blue,
            ),
            ClockHandModel(
              id: 1,
              angle: pi,
              color: Colors.red,
            ),
            ClockHandModel(
              id: 2,
              angle: pi / 2,
              color: Colors.purple,
            ),
          ],
        );
      },
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 8,
        children: renderClocks(),
      ),
    );
  }

  List<Widget> renderClocks() {
    return _analogClockData.map((analogClockData) {
      return AnalogClock(
        id: analogClockData.id,
      );
    }).toList();
  }
}
