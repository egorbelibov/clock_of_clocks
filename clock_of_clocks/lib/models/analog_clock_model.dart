import 'package:flutter/widgets.dart';

import 'clock_hand_model.dart';

/// Represents a model of an actual [AnalogClock] widget.
class AnalogClockModel {
  int id;
  List<ClockHandModel> clockHands;

  /// Identifies the clock's function.
  final String label;

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
    Color handsNewColor,
    Curve handsNewAnimationCurve,
    Duration handsNewAnimationDuration,
  }) {
    return AnalogClockModel(
      id: id,
      label: newLabel ?? label,
      clockHands: clockHands.map((clockHandModel) {
        return clockHandModel.copyWith(
          newColor: handsNewColor,
          newAnimationCurve: handsNewAnimationCurve,
          newAnimationDuration: handsNewAnimationDuration,
        );
      }).toList(),
    );
  }
}
