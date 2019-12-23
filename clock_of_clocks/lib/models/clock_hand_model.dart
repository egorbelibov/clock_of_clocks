import 'package:flutter/widgets.dart';

class ClockHandModel {
	final int id;
	double angle;
	Color color;

	ClockHandModel({
		@required this.id,
		@required this.angle,
		this.color,
	}) : assert(angle != null);
}
