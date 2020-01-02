// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'clock_hand_model.dart';

/// Represents a model of an actual [AnalogClock] widget.
class AnalogClockModel {
  int id;
  List<ClockHandModel> clockHands;

  /// Discloses the clock function.
  String label;

  AnalogClockModel({
    @required this.id,
    @required this.clockHands,
    this.label,
  })  : assert(id != null),
        assert(clockHands != null);

  /// Copies instance of [AnalogClockModel] with a [handsNewColor] for [clockHands].
  ///
  /// Makes a copy of the calling instance of [AnalogClockModel].
  /// Then, iterates through every [ClockHandModel] in [clockHands] and creates,
  /// for each, a new instance with the provided params (if provided).
  AnalogClockModel copyWith({
    String newLabel,
    double handsNewAngle,
    Color handsNewColor,
    Curve handsNewAnimationCurve,
    Duration handsNewAnimationDuration,
    List<ClockHandModel> newClockHands,
  }) {
    var handModels = newClockHands ?? clockHands;
    return AnalogClockModel(
      id: id,
      label: newLabel ?? label,
      clockHands: handModels.map((clockHandModel) {
        return clockHandModel.copyWith(
          newAngle: handsNewAngle,
          newColor: handsNewColor,
          newAnimationCurve: handsNewAnimationCurve,
          newAnimationDuration: handsNewAnimationDuration,
        );
      }).toList(),
    );
  }
}
