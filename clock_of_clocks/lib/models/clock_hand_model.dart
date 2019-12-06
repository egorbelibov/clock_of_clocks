import 'package:flutter/widgets.dart';

class ClockHandModel {
  Color color;
  double angle;

  ClockHandModel({
    this.color,
    @required this.angle,
  }) : assert(angle != null);
}
