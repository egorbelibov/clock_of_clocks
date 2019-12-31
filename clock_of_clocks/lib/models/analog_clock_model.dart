import 'package:flutter/widgets.dart';

import 'clock_hand_model.dart';

/// Represents a model of an actual [AnalogClock] widget.
class AnalogClockModel {
  int id;
  List<ClockHandModel> clockHands;

  AnalogClockModel({
    @required this.id,
    @required this.clockHands,
  })  : assert(id != null),
        assert(clockHands != null);

  /// Copies instance of [AnalogClockModel] with a [newColor] for [clockHands].
  ///
  /// Makes a copy of the calling instance of [AnalogClockModel].
  /// Then, iterates through every [ClockHandModel] in [clockHands] and creates,
  /// for each, a new instance with the provided params (if provided).
  AnalogClockModel copyWith({
    Color newColor,
    Curve newAnimationCurve,
    Duration newAnimationDuration,
  }) {
    return AnalogClockModel(
      id: id,
      clockHands: clockHands.map((clockHandModel) {
        return clockHandModel.copyWith(
          newColor: newColor,
          newAnimationCurve: newAnimationCurve,
          newAnimationDuration: newAnimationDuration,
        );
      }).toList(),
    );
  }
}
