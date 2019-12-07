import 'dart:math';

import 'package:flutter/widgets.dart';

import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';

/// Is responsible for initializing, updating and notifying
/// listening widgets about [analogClockData] changes.
class ClockState with ChangeNotifier {
  final int amountOfClocks = 120;

  /// Holds the state of all the analog clocks
  final List<AnalogClockModel> analogClockData = [];

  ClockState() {
    initializeClockState();
  }

  /// Generate initial state data for [analogClockData].
  void initializeClockState() {
    for (var i = 0; i < amountOfClocks; i++) {
      analogClockData.add(
        AnalogClockModel(
					id: i,
          clockHands: [
            ClockHandModel(id: 0, angle: pi),
            ClockHandModel(id: 1, angle: pi / 2),
          ],
        ),
      );
    }
  }

  void updateSingleClock({
    @required int id,
    double nextAngle,
    Color nextColor,
    bool notifyChanges = false,
  }) {
		assert(id != null);
	}

	void updateMultipleClocks({
		@required List<AnalogClockModel> clockData,

	}) {}

  void updateClockGroup({
    @required List<int> ids,
    double nextAngle,
    Color nextColor,
    bool notifyChanges = false,
  }) {
		assert(ids != null);
	}
}
