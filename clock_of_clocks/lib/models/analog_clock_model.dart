import 'package:flutter/widgets.dart';

import 'clock_hand_model.dart';

class AnalogClockModel {
	final int id;
	List<ClockHandModel> clockHands;

	AnalogClockModel({
		@required this.id,
		@required this.clockHands,
	}) : assert(clockHands != null);
}
