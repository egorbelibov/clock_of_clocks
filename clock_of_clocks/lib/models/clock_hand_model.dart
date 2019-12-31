import 'package:flutter/widgets.dart';

/// Represents a model of an actual [ClockHand] widget.
class ClockHandModel {
  final int id;
  double angle;
  Color color;

  ClockHandModel({
    @required this.id,
    @required this.angle,
    this.color,
  })  : assert(id != null),
        assert(angle != null);

  /// Copies instance of [ClockHandModel] with a different [color].
  ClockHandModel copyWith({Color color}) {
    return ClockHandModel(
      id: id,
      angle: angle,
      color: color,
    );
  }
}
