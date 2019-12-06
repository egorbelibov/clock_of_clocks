import 'package:flutter/widgets.dart';

import 'clock_hand_model.dart';

class AnalogClockModel {
  List<ClockHandModel> clockHands;

  AnalogClockModel({
    @required this.clockHands,
  }) : assert(clockHands != null);
}
