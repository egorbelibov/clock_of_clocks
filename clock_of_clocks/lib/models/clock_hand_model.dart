import 'package:flutter/widgets.dart';

/// Represents a model of an actual [ClockHand] widget.
class ClockHandModel {
  final int id;
  double angle;
  Color color;
  Curve animationCurve;
  Duration animationDuration;

  ClockHandModel({
    @required this.id,
    @required this.angle,
    this.color,
    this.animationCurve = Curves.elasticOut,
    this.animationDuration = const Duration(milliseconds: 3000),
  })  : assert(id != null),
        assert(angle != null);

  /// Copies instance of [ClockHandModel] with a new params (if provided).
  ClockHandModel copyWith({
    Color newColor,
    Curve newAnimationCurve,
    Duration newAnimationDuration,
  }) {
    return ClockHandModel(
      id: id,
      angle: angle,
      color: newColor ?? color,
      animationCurve: newAnimationCurve ?? animationCurve,
      animationDuration: newAnimationDuration ?? animationDuration,
    );
  }
}
