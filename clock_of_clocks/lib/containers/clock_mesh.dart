// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../containers/analog_clock.dart';
import '../models/analog_clock_model.dart';
import '../state/clock_state.dart';

/// An 8x15 Mesh (Grid) of Analog Clocks
///
/// The size of the [ClockMesh] is determined by the device height.
/// As a result, this might not fit into some device screens.
/// When it doesn't you can provide a custom height for your device.
class ClockMesh extends StatefulWidget {
  @override
  _ClockMeshState createState() => _ClockMeshState();
}

class _ClockMeshState extends State<ClockMesh> {
  ClockState clockState;
  List<AnalogClockModel> _analogClocks = [];

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  void _initializeValues() {
    clockState = PropertyChangeProvider.of<ClockState>(
      context,
      listen: false,
    ).value;
    _analogClocks = clockState?.clockMeshModels;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 70, bottom: 70),
        child: _buildGridView(),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      crossAxisCount: 8,
      children: _buildClocks(),
    );
  }

  List<Widget> _buildClocks() {
    return _analogClocks.map((analogClockData) {
      // Safety check (shouldn't happen).
      return analogClockData == null
          ? Container()
          : AnalogClock(id: analogClockData.id);
    }).toList();
  }
}
