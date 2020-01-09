// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../helpers/arrangers/clock_digit_arranger.dart';
import '../helpers/cardinal_directions.dart';
import '../helpers/manipulators/clock_digit_manipulator.dart';
import '../helpers/transformers/time_transformer.dart';
import '../models/analog_clock_model.dart';
import 'arrangements/clock_arrangements.dart';
import 'arrangements/clock_bit_arrangements.dart';

/// Total amount of analog clocks drawn on screen.
///
/// Image graphic of the clock mesh:
/// https://drive.google.com/open?id=1n0gspZDl4CCM1Uak-gC4WQisSje9mJUX
///
/// **IMPORTANT**: Shouldn't be changed! (Unless you know what you're doing 😀).
const int amountOfClocks = 120;

/// Total amount of digits displayed on screen.
///
/// Image graphic of showing each separated digit:
/// https://drive.google.com/open?id=1n0gspZDl4CCM1Uak-gC4WQisSje9mJUX
///
/// **IMPORTANT**: Shouldn't be changed! (Unless you know what you're doing 😀).
const int amountOfDigits = 4;

/// Holds Global State for the clock.
///
/// Is responsible for initializing, updating and notifying
/// all listening widgets about [clockMeshModels] changes.
class ClockState extends PropertyChangeNotifier<String> {
  /// Accurate representation of current time.
  ///
  /// It's updated periodically by [_updateTime()].
  DateTime _currentTime;

  /// A countdown timer responsible for updating [_currentTime].
  Timer _timer;

  // Updated, when changed, by [ClockModel].
  bool is24HourFormat = true;

  /// Holds the state of all the analog clock models.
  List<AnalogClockModel> clockMeshModels = List(amountOfClocks);

  /// Digit values representing current time.
  ///
  /// The values represent:
  /// - [0] & [1]: hour digits.
  /// - [2] & [3]: minute digits.
  Map<int, int> _digits = {
    0: null, // First hour digit.
    1: null, // Second hour digit.
    2: null, // First minute digit.
    3: null, // Second minute digit
  };

  /// Mid bit section's clock [id]'s and their hand angles in rads.
  ///
  /// The values are in rads and represent the following additional time information:
  /// - [58]: minute progress (1..60s).
  /// - [59]: hour progress (1..60m).
  /// - [60]: day progress (1..24h).
  /// - [61]: month progress (1..365d).
  ///
  /// All have a default value of (3 * pi / 2) which represents the intuitive value
  /// of the 12 o'clock mark on an analog clock ([Direction.north]).
  Map<int, double> _midBitAngles = {
    58: 3 * pi / 2,
    59: 3 * pi / 2,
    60: 3 * pi / 2,
    61: 3 * pi / 2,
  };

  ClockState() {
    _initializeClockState();
    Future.delayed(Duration(milliseconds: 2000), () {
      _initializeClockTimeState();
    });
  }

  /// Sets initial clock state data for [clockMeshModels].
  void _initializeClockState() {
    clockMeshModels = List.from(
      clockArrangements[ClockArrangement.defaultArrangement],
    );
  }

  /// Sets initial clock state data responsible for showing time.
  void _initializeClockTimeState() {
    _timer?.cancel();
    _initializeMidBitState();
    _updateTime();
  }

  /// Sets default [midBit] clock group arrangement from [clockBitArrangements].
  void _initializeMidBitState() {
    updateClockGroup(
      clockGroup: clockBitArrangements[ClockBitArrangement.midBit],
    );
  }

  /// Recursivelly updates local time.
  void _updateTime() {
    _currentTime = DateTime.now();
    // Update once per second. Make sure to do it at the beginning of each
    // new second, so that the clock is accurate.
    _timer = Timer(
      Duration(seconds: 1) - Duration(milliseconds: _currentTime.millisecond),
      _updateTime,
    );

    _updateClockTimeState();
  }

  void _updateClockTimeState() {
    _updateMidBitState();
    _updateDigits();
  }

  /// Determines if there are new [newMidBitAngles] and updates them accordingly.
  void _updateMidBitState() {
    Map<int, double> newMidBitAngles = timeToMidBitAngles(time: _currentTime);

    newMidBitAngles.forEach((index, newAngle) {
      assert(index >= 58 && index <= 61);
      assert(newAngle != null);

      if (_midBitAngles[index] != newAngle) {
        _midBitAngles[index] = newAngle;
        updateSingleClockWith(id: index, handsNewAngle: newAngle);
      }
    });
  }

  /// Determines if there are new [_digits] and updates them accordingly.
  ///
  /// The new [_digits] are arranged into [digitClocks] and modified when appropriate.
  /// Ultimately, the arranged [digitClocks] are passed down to [updateClockGroup].
  void _updateDigits() {
    Map<int, int> newDigits = timeToDigits(is24HourFormat, _currentTime);

    newDigits.forEach((index, newDigit) {
      if (_digits[index] != newDigit) {
        _digits[index] = newDigit;

        List<AnalogClockModel> digitClocks = arrangeClockDigit(
          digitIndex: index,
          digit: newDigit,
        );

        if (index == 0) {
          colourDigit(digit: _digits[index], digitClocks: digitClocks);
        }

        updateClockGroup(clockGroup: digitClocks);
      }
    });
  }

  /// Updates provided params for [AnalogClockModel] with corresponding [id].
  void updateSingleClockWith({
    @required int id,
    String newLabel,
    double handsNewAngle,
    Color handsNewColor,
    Curve handsNewAnimationCurve,
    Duration handsNewAnimationDuration,
    bool notifyChanges = true,
  }) {
    assert(id != null);

    clockMeshModels[id] = clockMeshModels[id].copyWith(
      newLabel: newLabel,
      handsNewAngle: handsNewAngle,
      handsNewColor: handsNewColor,
      handsNewAnimationCurve: handsNewAnimationCurve,
      handsNewAnimationDuration: handsNewAnimationDuration,
    );

    if (notifyChanges) notifyListeners(id.toString());
  }

  /// Updates [clockMeshModels] with each [clockModel] inside [clockGroup].
  void updateClockGroup({
    @required List<AnalogClockModel> clockGroup,
    bool notifyChanges = true,
  }) {
    assert(clockGroup != null);

    clockGroup.forEach((clockModel) {
      assert(clockMeshModels[clockModel.id] != null);

      clockMeshModels[clockModel.id] = clockMeshModels[clockModel.id].copyWith(
        newLabel: clockModel.label,
        newClockHands: clockModel.clockHands,
      );

      if (notifyChanges) notifyListeners(clockModel.id.toString());
    });
  }
}
