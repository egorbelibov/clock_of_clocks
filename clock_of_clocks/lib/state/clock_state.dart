import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';

/// Is responsible for initializing, updating and notifying
/// listening widgets about [analogClockModels] changes.
class ClockState extends PropertyChangeNotifier<String> {
  final int amountOfClocks = 120;

  /// Holds the state of all the analog clocks
  final List<AnalogClockModel> analogClockModels = [];

  ClockState() {
    initializeClockState();
  }

  /// Generate initial state data for [analogClockModels].
  void initializeClockState() {
    for (var i = 0; i < amountOfClocks; i++) {
      analogClockModels.add(
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

  /// Update [clockHands] for the clock with corresponding [id]
  void updateSingleClock({
    @required int id,
    @required List<ClockHandModel> clockHands,
    bool notifyChanges = true,
  }) {
    assert(id != null);
    assert(clockHands != null);

    analogClockModels[id].clockHands = clockHands;

    if (notifyChanges) notifyListeners(id.toString());
  }

  /// Update [clockHands] for all the clocks with corresponding [ids]
  void updateMultipleClocks({
    @required List<int> ids,
    @required List<ClockHandModel> clockHands,
    bool notifyChanges = true,
  }) {
    assert(ids != null);
    assert(clockHands != null);

    ids.forEach((id) {
      analogClockModels[id].clockHands = clockHands;
      if (notifyChanges) notifyListeners(id.toString());
    });
  }

  /// Update [analogClockModels] with each [clockModel] inside [clockGroup]
  void updateClockGroup({
    @required List<AnalogClockModel> clockGroup,
    bool notifyChanges = true,
  }) {
    assert(clockGroup != null);
    clockGroup.forEach((clockModel) {
      analogClockModels[clockModel.id].clockHands = clockModel.clockHands;
      if (notifyChanges) notifyListeners(clockModel.id.toString());
    });
  }
}
