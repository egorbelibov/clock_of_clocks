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
}
