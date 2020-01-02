import 'package:flutter/widgets.dart';

import '../../models/analog_clock_model.dart';
import '../../models/clock_hand_model.dart';
import '../../state/arrangements/clock_hand_arrangements.dart';

/// Clock Group of [ClockHandArrangement]'s.
///
/// Facilitates grouping [AnalogClockModel] based on their [ClockHandArrangements]'s.
/// [first] and [last] represent the group bounds. Both are included in the group.
class ClockGroup {
  final int first;
  final int last;

  /// Used for all the [AnalogClockModel] with ids in the [first] to [last] range.
  final ClockHandArrangement arrangement;

  /// Custom & optional paramer for the [AnalogClockModel].
  final String label;

  /// Group of custom & optional parameters the group clockHands.
  final Color handsColor;
  final double handsAngle;
  final Curve handsAnimationCurve;
  final Duration handsAnimationDuration;

  const ClockGroup(
    this.first,
    this.last,
    this.arrangement, {
    this.label,
    this.handsAngle,
    this.handsColor,
    this.handsAnimationCurve,
    this.handsAnimationDuration,
  });

  /// Assesses if any custom params have been provided.
  ///
  /// **NOTE**: [label], although a custom param, is not included since
  /// it's part of the [AnalogClockModel], not of [ClockHandModel].
  bool _holdsCustomClockHandParams() {
    return handsAngle != null ||
        handsColor != null ||
        handsAnimationCurve != null ||
        handsAnimationDuration != null;
  }
}

/// Arranges the provided List of [ClockGroup]'s into [arrangedClocks].
List<AnalogClockModel> arrangeClockGroups({
  @required List<ClockGroup> clockGroups,
}) {
  assert(clockGroups != null);
  List<AnalogClockModel> arrangedClocks = [];
  clockGroups.forEach(
    (clockGroup) {
      assert(clockGroup != null);
      for (var i = clockGroup.first; i <= clockGroup.last; i++) {
        List<ClockHandModel> clockHands = List.from(
          clockHandArrangements[clockGroup.arrangement],
        );

        if (clockGroup._holdsCustomClockHandParams()) {
          clockHands = _updateClockHands(clockGroup, clockHands);
        }

        arrangedClocks.add(AnalogClockModel(
          id: i,
          label: clockGroup.label,
          clockHands: clockHands,
        ));
      }
    },
  );
  return arrangedClocks;
}

/// Copies and updates each [ClockHandModel] in [clockHands], then returns.
List<ClockHandModel> _updateClockHands(
  ClockGroup clockGroup,
  List<ClockHandModel> clockHands,
) {
  assert(clockGroup != null);
  assert(clockHands != null);

  return clockHands.map((clockHandModel) {
    return clockHandModel.copyWith(
      newAngle: clockGroup.handsAngle,
      newColor: clockGroup.handsColor,
      newAnimationCurve: clockGroup.handsAnimationCurve ?? defaultCurve,
      newAnimationDuration:
          clockGroup.handsAnimationDuration ?? defaultDuration,
    );
  }).toList();
}
