import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../components/analog_clock.dart';
import '../models/analog_clock_model.dart';
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

  ClockState clockState;
  List<AnalogClockModel> _analogClockData = [];

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  void initializeValues() {
    clockState = PropertyChangeProvider.of<ClockState>(
      context,
      listen: false,
    ).value;
    _analogClockData = clockState?.analogClockModels;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _containerWidth,
        height: _containerHeight,
        child: renderGridView(),
      ),
    );
  }

  Widget renderGridView() {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 8,
      children: renderClocks(),
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
