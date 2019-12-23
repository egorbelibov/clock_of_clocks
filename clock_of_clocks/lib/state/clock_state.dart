import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';

/// Shouldn't be changed!
///
/// Responsible for the total amount of analog clocks
/// drawn on screen.
const int amountOfClocks = 120;

/// Holds Global State for the clock
///
/// Is responsible for initializing, updating and notifying
/// all listening widgets about [analogClockModels] changes.
class ClockState extends PropertyChangeNotifier<String> {
  /// DateTime updated each second by
  DateTime _currentTime;
  var temperature = '';
  var temperatureRange = '';
  var condition = '';
  var location = '';

  /// Holds the state of all the analog clocks.
  final List<AnalogClockModel> analogClockModels = [];

  ClockState() {
    // Initialize time.
    _updateTime();
    initializeClockState();
  }

  void _updateTime() {
    _currentTime = DateTime.now();
    // Update once per second. Make sure to do it at the beginning of each
    // new second, so that the clock is accurate.
    Timer(
      Duration(seconds: 1) - Duration(milliseconds: _currentTime.millisecond),
      _updateTime,
    );
    // TODO: determine who has to be notified
  }

  /// Update 
  void updateModel(ClockModel clockModel) {
    temperature = clockModel.temperatureString;
    temperatureRange = '(${clockModel.low} - ${clockModel.highString})';
    condition = clockModel.weatherString;
    location = clockModel.location;
    // TODO: Notify corresponding widgets
  }

  /// Generate initial state data for [analogClockModels].
  void initializeClockState() {
    for (var i = 0; i < amountOfClocks; i++) {
      analogClockModels.add(
        AnalogClockModel(
          id: i,
          clockHands: [
            ClockHandModel(id: 0, angle: pi / 2),
            ClockHandModel(id: 1, angle: 2 * pi),
          ],
        ),
      );
    }
  }

  /// Update [clockHands] for the clock with corresponding [id].
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

  /// Update [clockHands] for all the clocks with corresponding [ids].
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

  /// Update [analogClockModels] with each [clockModel] inside [clockGroup].
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
