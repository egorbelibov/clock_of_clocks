import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../helpers/arrangers/clock_digit_arranger.dart';
import '../helpers/manipulators/clock_digit_manipulator.dart';
import '../helpers/transformers/time_transformer.dart';
import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';
import 'arrangements/clock_arrangements.dart';
import 'arrangements/clock_bit_arrangements.dart';

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

  ///
  List<int> midColumnValues = List();

  // Updated by ClockModel.
  var is24HourFormat = true;

  /// Holds the state of all the analog clocks.
  List<AnalogClockModel> analogClockModels = List(amountOfClocks);

  ClockState() {
    _initializeClockState();
    Future.delayed(Duration(milliseconds: 2000), () {
      // First call initializes _currentTime & notifies related widgets.
      _initializeTime();
    });
  }

  /// Generates initial state data for [analogClockModels].
  void _initializeClockState() {
    analogClockModels = List.from(
      clockArrangements[ClockArrangement.defaultArrangement],
    );
  }

  void _initializeTime() {
    // TODO: do something with bitArrangements || put this into a separate helper function.
    var bitArrangements = clockBitArrangements[ClockBitArrangement.midBit];
    _updateTime();
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

    List<int> newDigits = breakdownTimeIntoDigits(
      is24HourFormat: is24HourFormat,
      time: _currentTime,
    );

    _updateDigits(newDigits);
  }

  /// Determines if there are new [digits] and updates them accordingly.
  ///
  /// The new [digits] are arranged into [digitClocks] and modified when appropriate.
  /// Ultimately, the arranged [digitClocks] are passed down to [updateClockGroup].
  void _updateDigits(List<int> newDigits) {
    for (var i = 0; i < amountOfDigits; i++) {
      if (newDigits[i] != digits[i]) {
        digits[i] = newDigits[i];

        List<AnalogClockModel> digitClocks = arrangeClockDigit(
          digitIndex: i,
          digit: digits[i],
        );

        // Emphasize the First Hour Digit (0th digit overall)
        if (i == 0) colourDigit(digit: digits[i], digitClocks: digitClocks);

        updateClockGroup(clockGroup: digitClocks);
      }
    }
  }

  /// Updates local variables based on [clockModel].
  void updateModel(ClockModel clockModel) {
    is24HourFormat = clockModel.is24HourFormat;
  }

  /// Updates [clockHands] for the clock with corresponding [id].
  void updateSingleClock({
    @required int id,
    @required List<ClockHandModel> clockHands,
    bool notifyChanges = true,
  }) {
    assert(id != null);
    assert(clockHands != null);
    assert(analogClockModels[id] != null);

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
      assert(analogClockModels[id] != null);
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
      assert(analogClockModels[clockModel.id] != null);
      analogClockModels[clockModel.id].clockHands = clockModel.clockHands;
      if (notifyChanges) notifyListeners(clockModel.id.toString());
    });
  }
}
