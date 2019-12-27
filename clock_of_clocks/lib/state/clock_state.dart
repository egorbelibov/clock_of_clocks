import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';
import 'clock_arrangements.dart';

/// Represents the total amount of analog clocks drawn on screen.
///
/// IMPORTANT: Shouldn't be changed! (Unless you know what you're doing 😀).
const int amountOfClocks = 120;

/// Represents the total amount of digits displayed on screen.
///
/// IMPORTANT: Shouldn't be changed! (Unless you know what you're doing 😀).
const int amountOfDigits = 4;

/// Holds Global State for the clock.
///
/// Is responsible for initializing, updating and notifying
/// all listening widgets about [analogClockModels] changes.
class ClockState extends PropertyChangeNotifier<String> {
  /// Accurate representation of current time.
  ///
  /// It's updated periodically by [_updateTime()].
  DateTime _currentTime;

  /// Digit values representing current time.
  ///
  /// Its size is based on [amountOfDigits].
  /// [0, 1] represent hour digits.
  /// [2, 3] represent minute digits.
  List<int> digits = List(amountOfDigits);

  // TODO: Add bool here: displayDigits OR something similar.

  // Group of Variables updated by ClockModel.
  var is24HourFormat = true;
  var temperature = '';
  var temperatureRange = '';
  var condition = '';
  var location = '';

  /// Holds the state of all the analog clocks.
  List<AnalogClockModel> analogClockModels = List(amountOfClocks);

  ClockState() {
    // Initialize time.
    _updateTime();
    _initializeClockState();
  }

  /// Generates initial state data for [analogClockModels].
  void _initializeClockState() {
    analogClockModels = clockArrangements[ClockArrangement.defaultArrangement];
  }

  /// Recursivelly updates local time.
  void _updateTime() {
    _currentTime = DateTime.now();
    // Update once per second. Make sure to do it at the beginning of each
    // new second, so that the clock is accurate.
    Timer(
      Duration(seconds: 1) - Duration(milliseconds: _currentTime.millisecond),
      _updateTime,
    );

    // TODO: Notify analog clock in charge of second to second animation.

    List<int> newDigits = _breakdownCurrentTime();
    _notifyNewTime(newDigits);
  }

  /// Breaksdown current time into 4 digit values.
  ///
  /// Formats hour to correct type (based on [is24HourFormat]).
  /// Then, determines, stores and returns the corresponding digits ([newDigits]).
  List<int> _breakdownCurrentTime() {
    var formattedHour = double.parse(
      DateFormat(
        is24HourFormat ? 'HH' : 'hh',
      ).format(_currentTime),
    );

    List<int> newDigits = List(amountOfDigits);
    newDigits[0] = (formattedHour / 10).floor(); // First Hour Digit.
    newDigits[1] = (formattedHour % 10).floor(); // Second Hour Digit.
    newDigits[2] = (_currentTime.minute / 10).floor(); // First Minute Digit.
    newDigits[3] = _currentTime.minute % 10; // Second Minute Digit.
    return newDigits;
  }

  void _notifyNewTime(List<int> newDigits) {
    for (var i = 0; i < amountOfDigits; i++) {
      if (newDigits[i] != digits[i]) {
        digits[i] = newDigits[i];
        print('notify [$i] digit');
        // TODO: create helper function to getDigitArrangements in [AnalogClockModel]'s.
        // TODO: update and notify the updated model listeners.
      }
    }
  }

  /// Updates local variables based on [clockModel].
  void updateModel(ClockModel clockModel) {
    is24HourFormat = clockModel.is24HourFormat;
    temperature = clockModel.temperatureString;
    temperatureRange = '(${clockModel.low} - ${clockModel.highString})';
    condition = clockModel.weatherString;
    location = clockModel.location;
    // TODO: Notify corresponding widgets.
  }

  /// Updates [clockHands] for the clock with corresponding [id].
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

  /// Updates [clockHands] for all the clocks with corresponding [ids].
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

  /// Updates [analogClockModels] with each [clockModel] inside [clockGroup].
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
