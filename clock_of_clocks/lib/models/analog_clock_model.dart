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

  /// Copies instance of [AnalogClockModel] with a [color] for [clockHands].
  ///
  /// Makes a copy of the calling instance of [AnalogClockModel].
  /// Then, iterates through every [ClockHandModel] in [clockHands] and creates,
  /// for each, a new instance with the provided [color].
  AnalogClockModel copyWith({Color color}) {
    return AnalogClockModel(
      id: id,
      clockHands: clockHands.map((clockHandModel) {
        return clockHandModel.copyWith(color: color);
      }).toList(),
    );
  }
}
